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
        public IHttpActionResult Get([FromBody]ClassRequest clsReq)
        {
            try
            {
                ScheduleManager s = new ScheduleManager();
                return Ok(s.GetScheduleByClass(clsReq.c, clsReq.n));//TODO with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        public class ClassRequest
        {
            public int c { get; set; }
            public int n { get; set; }
            public DateDTO d { get; set; }
        }
        [HttpPost]
        [Route("get/teacher")]
        public IHttpActionResult Get([FromBody]TeacherRequest teachReq)
        {
            try
            {
                ScheduleManager s = new ScheduleManager();
                return Ok(s.GetScheduleByTeacher(teachReq.id));//TODO with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        public class TeacherRequest
        {
            public int id { get; set; }
            public DateDTO d { get; set; }
        }
        [HttpPost]
        [Route("get/layer")]
        public IHttpActionResult GetLayer([FromBody]LayerRequest layReq)
        {
            try
            {
                ScheduleManager s = new ScheduleManager();
                return Ok(s.GetScheduleByLayer(layReq.l));//TODO 1.implement 2.with date
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        public class LayerRequest
        {
            public int l { get; set; }
            public DateDTO d { get; set; }
        }
    }
}
