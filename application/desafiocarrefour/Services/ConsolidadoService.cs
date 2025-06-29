using desafiocarrefour.Models;
using desafiocarrefour.Data;
using System;
using System.Linq;

namespace desafiocarrefour.Services
{
    public class ConsolidadoService
    {
        private readonly AppDbContext _context;

        public ConsolidadoService(AppDbContext context)
        {
            _context = context;
        }


        public SaldoConsolidado ObterSaldoPorData(DateTime data)
        {
            data = DateTime.SpecifyKind(data, DateTimeKind.Utc);

            var lancamentos = _context.Lancamentos
                .Where(x => x.Data.Date == data.Date)
                .ToList();

            decimal saldo = 0;
            foreach (var lanc in lancamentos)
            {
                saldo += lanc.Tipo == "credito" ? lanc.Valor : -lanc.Valor;
            }

            return new SaldoConsolidado
            {
                Data = data,
                Saldo = saldo
            };
        }


    }
}