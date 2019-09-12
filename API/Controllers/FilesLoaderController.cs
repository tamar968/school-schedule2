using BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
    [RoutePrefix("api")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FilesLoaderController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("load")]//define the url
        public IHttpActionResult LoadFiles([FromBody]LoadRequest pathObj)
        {
            try
            {
                var xmlManager = new XmlManager();
                xmlManager.LoadDirectory("@" + pathObj.path);
                return Ok();
            }
            catch(Exception e)
            {             
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        public class LoadRequest
        {
            public string path { get; set; }
        }
    }
}
