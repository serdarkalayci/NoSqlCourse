docker run -p 6379:6379 --name movie-redis -d redis

# Create a new WebApi project
dotnet new webapi -o MovieApi

# Add Redis
dotnet add package StackExchange.Redis --version 2.0.601

# Add Mongo
dotnet add package MongoDB.Driver -v 2.9.1