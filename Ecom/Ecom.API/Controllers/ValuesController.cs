﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ecom.LoggerService.Contracts;
using Ecom.Repository.Contracts;
using Microsoft.AspNetCore.Mvc;

namespace Ecom.API.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        private ILoggerManager _logger;
        private IRepositoryWrapper _repoWrapper;

        public ValuesController(ILoggerManager logger, IRepositoryWrapper repoWrapper)
        {
            _logger = logger;
            _repoWrapper = repoWrapper;
        }
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            var shops = _repoWrapper.Item.FindByCondition(item => item.Name.Contains("del"));

            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
