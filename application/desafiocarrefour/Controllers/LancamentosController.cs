using Microsoft.AspNetCore.Mvc;
using desafiocarrefour.Models;
using desafiocarrefour.Services;

namespace desafiocarrefour.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class LancamentosController : ControllerBase
    {
        private readonly LancamentoService _service;

        public LancamentosController(LancamentoService service)
        {
            _service = service;
        }

        [HttpPost]
        public IActionResult Post([FromBody] Lancamento lancamento)
        {
            _service.Adicionar(lancamento);
            return Created("", lancamento);
        }
    }
}