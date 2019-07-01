using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;
using DTO;

namespace API.Controllers
{
    [RoutePrefix("api/StudyTime")]//define the url
    [EnableCors(origins: "*", headers: "*", methods: "*")]//access allow for all clients and methods
    public class StudyTimeController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("add")]//define the url
        public IHttpActionResult Add([FromBody]DairyDTO lesson)
        {
            try
            {
                Lesson.Add(lesson);
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
        public IHttpActionResult Update([FromBody]DairyDTO lesson)
        {
            try
            {
                Lesson.Update(lesson);
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
        public IHttpActionResult Delete([FromBody]DairyDTO lesson)
        {
            try
            {
                Lesson.Delete(lesson);
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
                return Ok(Lesson.Get(id));
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("get")]
        public IHttpActionResult Get()
        {
            try
            {
                return Ok(Lesson.Get());
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
    }
}
