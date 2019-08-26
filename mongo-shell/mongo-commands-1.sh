docker run -d --name mongows mongo:latest
docker exec -it mongows bash

#Initial controls
db.test.save( { a: 1 } )
db.test.find()
db.stats()

# Create database
use mydb
db
show dbs
db.movie.insert({
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
    })

# Drop database
db.movie.drop()
db.dropDatabase()

# Create collection
use mydb
db.createCollection("movie")
show collections
db.movie.drop()

# Insert the same document twice 
db.movie.insert({
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
    })

db.movie.insert({
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
    })

db.movie.find().pretty()

# Now get one of them's _id and save it again
db.movie.save({
        "_id" : "5d5bfb1281670a7d98f9e9f6",
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
    })

db.movie.insert({
        "_id" : "5d5bfb1281670a7d98f9e9f6",
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"]
    })

