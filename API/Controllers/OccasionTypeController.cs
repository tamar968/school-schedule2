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
    public class OccasionTypeTypeController : ApiController
    {
        [RoutePrefix("api/occasion-type")]//define the url
        [EnableCors(origins: "*", headers: "*", methods: "*")]//access allow for all clients and methods
        public class OccasionTypeController : ApiController
        {
            [HttpPost]//define the data transfer method
            [Route("add")]//define the url
            public IHttpActionResult Add([FromBody]OccasionTypeDTO occasionType)
            {
                try
                {
                    OccasionType.Add(occasionType);
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
            public IHttpActionResult Update([FromBody]OccasionTypeDTO occasionType)
            {
                try
                {
                    OccasionType.Update(occasionType);
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
            public IHttpActionResult Delete([FromBody]int occasionType)
            {
                try
                {
                    OccasionType.Delete(occasionType);
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
                    return Ok(OccasionType.Get(id));
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
                    return Ok(OccasionType.Get());
                }
                catch (Exception e)
                {
                    LogManager.LogException(e);
                    return InternalServerError(e);
                }
            }

        }
    }
}
