# Group by director, number of movies
db.movie.aggregate([{$group : {_id : "$director", num_movies : {$sum : 1}}}])

# Group by director, avg score
db.movie.aggregate([{$group : {_id : "$director", avg_score : {$avg : "$score"}}}])

# Group by director, all scores as array
db.movie.aggregate([{$group : {_id : "$director", scores : {$push: "$score"}}}])

# Group by director, origins added to a set
db.movie.aggregate([{$group : {_id : "$director", origin : {$addToSet : "$origin"}}}])

# Filter using aggregation pipeline
db.movie.aggregate([{$match : {stars: 'Ryan Reynolds'}}]).pretty()

# Number of movies over the score 7, grouped by director
db.movie.aggregate([{$match : {"score": {$gte: 7.0}}},{$group : {_id : "$director", num_movies : {$sum : 1}}}]).pretty()

# Create a text index
db.movie.find({"name":"doctor"}).pretty()
db.movie.find({"name":"Doctor Strange"}).pretty()
db.movie.createIndex( { name: "text", description: "text" } )
db.movie.find( { $text: { $search: "doctor" }}).pretty()
db.movie.find( { $text: { $search: "Deadpool" }}).pretty()
db.movie.find( { $text: { $search: "Deadpool -2" }}).pretty()
db.movie.find(
   { $text: { $search: "Deadpool" }},
   { score: { $meta: "textScore" }}
).sort( { score: { $meta: "textScore" }}).pretty()