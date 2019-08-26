docker pull redis
docker run --name redisws --network host -d redis redis-server --appendonly yes
docker run -it --network host --rm redis redis-cli -h localhost
ping
config get *

#STRINGS
SET first "firststring"
GET first
SETEX timer 10 "itsnowornever"
GET timer
SET mynumber "10"
INCR mynumber
GET mynumber


#HASHES
HMSET user:1 username serdar password secret points 200
HGETALL user:1
HMSET user:2 username kemal password verysecret points 100

#LISTS
lpush tutoriallist redis 
lpush tutoriallist mongodb 
lpush tutoriallist cassandra 
LRANGE tutoriallist 0 -1
rpush tutoriallist hbase 
rpush tutoriallist dynamodb 
rpush tutoriallist elastic 
rpush tutoriallist neo4j 
LRANGE tutoriallist 0 -2

RPUSH mylist "one"
RPUSH mylist "twoo"
RPUSH mylist "three"
LPOP mylist
LRANGE mylist 0 -1
LSET mylist 0 "two"
LRANGE mylist 0 -1
LINSERT mylist BEFORE "two" "one"

#SETS
SADD myset "Hello"
SADD myset "World"
SADD myset "World"
SMEMBERS myset
SISMEMBER myset "Hello"
SISMEMBER myset "Universe"
SADD myset "Universe"
SRANDMEMBER myset

#SORTED SETS
ZADD myzset 1 "one"
ZADD myzset 2 "two" 3 "three"
ZRANGE myzset 0 -1 WITHSCORES
ZADD myzset 1 "uno"
ZRANGE myzset 0 -1 WITHSCORES
ZREVRANK myzset "uno"
ZADD myzset 3 "four"
ZINCRBY myzset 1 "four"
ZRANGEBYSCORE zset (1 5