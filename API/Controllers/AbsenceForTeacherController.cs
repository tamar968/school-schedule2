using BL;
using DAL;
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
    [RoutePrefix("api/absence-for-teacher")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AbsenceForTeacherController : ApiController
    {
        [HttpPost]
        [Route("add")]
        public IHttpActionResult Add([FromBody]AbsencesForTeacherDTO absenceForTeacher)
        {
            try
            {
                AbsenceForTeacher.Add(absenceForTeacher);
                return Ok();
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError();
            }
        }
        [HttpPost]
        [Route("update")]
        public IHttpActionResult Update([FromBody]AbsencesForTeacherDTO absenceForTeacher)
        {
            try
            {
                AbsenceForTeacher.Update(absenceForTeacher);
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
        public IHttpActionResult Delete([FromBody]AbsencesForTeacherDTO absenceForTeacher)
        {
            try
            {
                AbsenceForTeacher.Delete(absenceForTeacher);
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
                return Ok(AbsenceForTeacher.Get(id));
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
                return Ok(AbsenceForTeacher.Get());
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("getbyteacher/{id}")]
        public IHttpActionResult GetByTeacher([FromUri]int tid)
        {
            try
            {
                return Ok(AbsenceForTeacher.GetByTeacher(tid));
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
    }
}

