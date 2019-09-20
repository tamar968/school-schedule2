using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;
using DTO;

namespace API.Controllers
{
    [RoutePrefix("api/schedule")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ShceduleController : ApiController
    {
        [HttpPost]
        [Route("get/class")]
        public IHttpActionResult Get([FromBody]int c, int n, DateDTO d)
        {
            try
            {
                return Ok(ScheduleManager.GetScheduleByClass(c, n));//TODO with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpPost]
        [Route("get/teacher")]
        public IHttpActionResult Get([FromBody]int id, DateDTO d)
        {
            try
            {
                return Ok(ScheduleManager.GetScheduleByTeacher(id));//TODO with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpPost]
        [Route("get/layer")]
        public IHttpActionResult GetLayer([FromBody]int c, DateDTO d)
        {
            try
            {
                return Ok(ScheduleManager.GetScheduleByLayer(c));//TODO 1.implement 2.with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
    }
}
