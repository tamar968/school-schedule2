using BL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
    [RoutePrefix("api/class")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ClassController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("add")]//define the url
        public IHttpActionResult Add([FromBody]ClassDTO _class)
        {
            try
            {
                Class.Add(_class);
                return Ok();
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpPost]
        [Route("update")]
        public IHttpActionResult Update([FromBody]ClassDTO _class)
        {
            try
            {
                Class.Update(_class);
                return Ok();
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpPost]
        [Route("delete")]
        public IHttpActionResult Delete([FromBody]ClassDTO _class)
        {
            try
            {
                Class.Delete(_class);
                return Ok();
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("get/{id}")]
        public IHttpActionResult Get([FromUri]int id)
        {
            try
            {
                return Ok(content: Class.Get(id));
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("get/all")]
        public IHttpActionResult Get()
        {
            try
            {
                return Ok(content: Class.Get());
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("getbylayer/{layer}")]
        public IHttpActionResult GetByLayer([FromUri]int layer)
        {
            try
            {
                return Ok(content: Class.GetByLayer(layer));
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
    }
}
