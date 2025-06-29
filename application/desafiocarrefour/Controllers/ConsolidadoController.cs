using Microsoft.AspNetCore.Mvc;
using desafiocarrefour.Services;
using System;


namespace desafiocarrefour.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ConsolidadoController : ControllerBase
    {
        private readonly ConsolidadoService _service;

        public ConsolidadoController(ConsolidadoService service)
        {
            _service = service;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] DateTime data)
        {
            var saldo = _service.ObterSaldoPorData(data);
            return Ok(saldo);
        }
    }
}