using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;

namespace API.Controllers
{
    [RoutePrefix("api/schedule")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ShceduleController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("get")]//define the url
        public IHttpActionResult Get()
        {
            var s = new ScheduleManager();

            var l = s.GetScheduleByClass(9, 2);
            return Ok(l);
        }
    }
}
