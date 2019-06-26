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
    [RoutePrefix("api/Absence")]//define the url
    [EnableCors(origins: "*", headers: "*", methods: "*")]//access allow for all clients and methods
    public class AbsenceController : ApiController
    {
        //-
        [HttpPost]//define the data transfer method
        [Route("add")]//define the url
        public IHttpActionResult Add([FromBody]AbsenceDTO absence)
        {
            try
            {
                Absence.Add(absence);
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
        public IHttpActionResult Update([FromBody]AbsenceDTO absence)
        {
            try
            {
                Absence.Update(absence);
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
        public IHttpActionResult Delete([FromBody]AbsenceDTO absence)
        {
            try
            {
                Absence.Delete(absence);
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
                return Ok(Absence.Get(id));
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
        [HttpGet]
        [Route("getall")]
        public IHttpActionResult Get()
        {
            try
            {
                return Ok(Absence.Get());
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }
    }
}
