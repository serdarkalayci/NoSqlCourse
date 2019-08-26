namespace MovieApi.MongoDatabase
{
    public class MongoDatabaseSettings : IMongoDatabaseSettings
    {
        public string MoviesCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }

}