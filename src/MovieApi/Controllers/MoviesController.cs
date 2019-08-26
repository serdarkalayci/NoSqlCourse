using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MovieApi.RedisDatabase;
using MovieApi.MongoDatabase;
using StackExchange.Redis;
using MongoDB.Driver;
using MongoDB.Bson;
using MovieApi.Models;

namespace MovieApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoviesController : ControllerBase
    {
        private readonly IRedisDatabaseProvider _redisDatabaseProvider;
        private readonly IMongoCollection<Movie> _movies;

        public MoviesController(IRedisDatabaseProvider redisDatabaseProvider, IMongoDatabaseSettings mongoDatabaseSettings)
        {
            _redisDatabaseProvider = redisDatabaseProvider;
            
            var client = new MongoClient(mongoDatabaseSettings.ConnectionString);
            var database = client.GetDatabase(mongoDatabaseSettings.DatabaseName);
            _movies = database.GetCollection<Movie>(mongoDatabaseSettings.MoviesCollectionName);
        }

        [HttpGet]
        public ActionResult<List<Movie>> Get()
        {
            // Read all movie data from mongo
            List<Movie> movies = _movies.Find(m => true).ToList();

            // Add all movie data to redis
            var db = _redisDatabaseProvider.GetDatabase();
            foreach (Movie movie in movies) {
                db.StringSet(movie.Id.ToString(), 0, TimeSpan.FromMinutes(10));
            }

            // Return full list
            return movies;
        }

        [HttpGet("{id:length(24)}", Name = "GetMovie")]
        public ActionResult<Movie> Get(string id)
        {
            // Read all movie data from mongo
            Movie movie = _movies.Find(m => m.Id == id).FirstOrDefault();

            // Get new score from redis and add to original score
            var db = _redisDatabaseProvider.GetDatabase();
            var value = db.StringGet(id);
            movie.Score += Double.Parse(value)/1000;

            // Return full list
            return movie;
        }

        [HttpPost]
        public IActionResult IncrementScore([FromBody]MovieCacheItem item)
        {
            var db = _redisDatabaseProvider.GetDatabase();
            db.StringIncrement(item.Key, item.Value);
            var value = db.StringGet(item.Key);

            // If value get over 100, update the original value
            double score = Double.Parse(value);
            if (score >= 100) {
                double addedscore = Math.Floor(score / 100);
                var filter = new BsonDocument("_id", ObjectId.Parse(item.Key));
                var update = new BsonDocument("$inc", new BsonDocument("score", addedscore/10));
                UpdateResult result = _movies.UpdateOne(filter, update);
                score = score % 100;
                db.StringSet(item.Key, score, TimeSpan.FromMinutes(10));
            }

            return Ok(value);
        }
    }
}