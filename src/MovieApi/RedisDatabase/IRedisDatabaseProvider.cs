using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StackExchange.Redis;

namespace MovieApi.RedisDatabase
{
    public interface IRedisDatabaseProvider
    {
        IDatabase GetDatabase();

    }
}