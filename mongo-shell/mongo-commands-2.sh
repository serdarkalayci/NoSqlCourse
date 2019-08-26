# Let's clean and import some data
docker run -d --name mongo-movies -e MONGO_INITDB_DATABASE=movies serdarkalayci/mongo-movies
docker exec -it mongo-movies bash
mongo
use movies

db.movie.find({"name":"Deadpool"}).pretty()
db.movie.find({"score":8.0}).pretty()
db.movie.find({"score":{$lt:7.0}}).pretty()
db.movie.find({"score":{$ne:7.5}}).pretty()
db.movie.find({"director":"Zack Snyder"}).pretty()
db.movie.find({
    $and: [
    {"director":"Zack Snyder"},
    {"score": {$gt: 7.0}}
    ]}).pretty()

db.movie.find({
    $or: [
    {"director":"Zack Snyder"},
    {"score": {$gte: 8.0}}
    ]}).pretty()

# Update
db.movie.update({'name':'300 2'},{$set:{'name':'300: Rise of an Empire'}})

# Delete
db.movie.insert({
        "name" : "Deneme",
        "score" : 10.0,
        "director": "Serdar Kalaycı",
        "stars" : ["Serdar Kalaycı"]
    })
db.movie.insert({
        "name" : "Deneme",
        "score" : 10.0,
        "director": "Serdar Kalaycı",
        "stars" : ["Serdar Kalaycı"]
    })

db.movie.remove({'name': 'Deneme'})
db.movie.remove({'name': 'Deneme'},1)

# Projection
db.movie.find({"score":{$gt:7.0}}, {'_id':0}).pretty()
db.movie.find({"score":{$gt:7.0}}, {'name':1}).pretty()
db.movie.find({"score":{$gt:7.0}}, {'_id':0, 'name':1}).pretty()

# Limit
db.movie.find({}, {'_id':0, 'name':1}).limit(3).pretty()
# Skip and limit
db.movie.find({}, {'_id':0, 'name':1}).skip(1).limit(3).pretty()

# Sort
db.movie.find({}, {'_id':0, 'name':1}).sort({'name':1})

# Name and Director, sorted by score desc, fisrt 3 movies
db.movie.find({}, {'_id':0, 'name':1, 'director':1}).sort({'score':-1}).limit(3)

db.movie.find({stars: 'Ryan Reynolds'}).pretty()

# Indexing
db.movie.ensureIndex({"name":1})
db.movie.ensureIndex({"score":-1})