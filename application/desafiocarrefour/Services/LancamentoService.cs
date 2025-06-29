using desafiocarrefour.Data;
using desafiocarrefour.Models;
using System;

namespace desafiocarrefour.Services
{
    public class LancamentoService
    {
        private readonly AppDbContext _context;

        public LancamentoService(AppDbContext context)
        {
            _context = context;
        }


        public void Adicionar(Lancamento lancamento)
        {
            // Força o DateTime para UTC
            lancamento.Data = DateTime.SpecifyKind(lancamento.Data, DateTimeKind.Utc);

            _context.Lancamentos.Add(lancamento);
            _context.SaveChanges();
        }


    }
}