using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MovieApi.Models
{
    public class Movie
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("score")]
        public double Score { get; set; }

        [BsonElement("director")]
        public string Director { get; set; }

        [BsonElement("stars")]
        public string[] Stars { get; set; }

        [BsonElement("origin")]
        public string Origin { get; set; }

    }
}