﻿using System;
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
    [RoutePrefix("api/occasion")]//define the url
    [EnableCors(origins: "*", headers: "*", methods: "*")]//access allow for all clients and methods
    public class OccasionController : ApiController
    {
        [HttpPost]//define the data transfer method
        [Route("add")]//define the url
        public IHttpActionResult Add([FromBody]OccasionDTO occasion)
        {
            try
            {
                Occasion.Add(occasion);
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
        public IHttpActionResult Update([FromBody]OccasionDTO occasion)
        {
            try
            {
                Occasion.Update(occasion);
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
        public IHttpActionResult Delete([FromBody]int occasion)
        {
            try
            {
                Occasion.Delete(occasion);
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
                return Ok(Occasion.Get(id));
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
                return Ok(Occasion.Get());
            }
            catch (Exception e)
            {
                LogManager.LogException(e);
                return InternalServerError(e);
            }
        }

    }
}
