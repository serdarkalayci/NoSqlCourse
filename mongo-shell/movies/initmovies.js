db.movie.drop();
db.movie.insertMany([
    {
        "name" : "Deadpool",
        "score" : 8.0,
        "director": "Tim Miller",
        "stars" : ["Ryan Reynolds", "Morena Baccarin", "T.J. Miller"],
        "origin" : "Marvel"
    },
    {
        "name" : "Doctor Strange",
        "score" : 7.5,
        "director": "Scott Derrickson",
        "stars" : ["Benedict Cumberbatch", "Tilda Swinton, ""Chiwetel Ejiofor", "Rachel McAdams"],
        "origin" : "Marvel"
    },
    {
        "name" : "Deadpool 2",
        "score" : 7.7,
        "director": "David Leitch",
        "stars" : ["Ryan Reynolds", "Josh Brolin", "Morena Baccarin"],
        "origin" : "Marvel"
    },
    {
        "name" : "Batman v Superman: Dawn of Justice",
        "score" : 6.5,
        "director": "Zack Snyder",
        "stars" : ["Ben Affleck", "Henry Cavill", "Amy Adams"],
        "origin" : "DC"
    },
    {
        "name" : "The Secret Life of Pets",
        "score" : 6.5,
        "director": "Chris Renaud",
        "stars" : ["Louis C.K.", "Eric Stonestreet", "Kevin Hart"],
        "origin" : "Other"
    },
    {
        "name" : "300",
        "score" : 7.7,
        "director": "Zack Snyder",
        "stars" : ["Gerard Butler", "Lena Headey", "David Wenham"],
        "origin" : "Greeks"
    },
    {
        "name" : "300 2",
        "score" : 7.7,
        "director": "Zack Snyder",
        "stars" : ["Sullivan Stapleton", "Eva Green", "Lena Headey"],
        "origin" : "Greeks"
    }
])