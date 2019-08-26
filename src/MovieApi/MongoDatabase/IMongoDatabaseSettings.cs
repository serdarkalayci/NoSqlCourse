namespace MovieApi.MongoDatabase
{
    public interface IMongoDatabaseSettings
    {
        string MoviesCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}