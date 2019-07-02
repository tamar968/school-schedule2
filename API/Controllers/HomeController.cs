using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
    [RoutePrefix("api")]//define the url
    [EnableCors(origins:"*",headers:"*",methods:"*")]//access allow for all clients and methods
    public class HomeController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("login")]//define the url
        public IHttpActionResult Login([FromBody]LoginRequest loginRequest)
        {
            if (loginRequest.password.Equals(WebConfigurationManager.AppSettings["password"])) {
                return StatusCode(HttpStatusCode.NoContent);
            }
            return Unauthorized();
        }

        public class LoginRequest
        {
            public string password { get; set; }
        }
    }
}
