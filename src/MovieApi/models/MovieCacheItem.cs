using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MovieApi.RedisDatabase;
using StackExchange.Redis;

namespace MovieApi.Models
{
        public class MovieCacheItem
    {
        public string Key { get; set; }
        public long Value { get; set; }
    }
}