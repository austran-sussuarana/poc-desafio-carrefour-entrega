using Xunit;
using desafiocarrefour.Data;
using desafiocarrefour.Models;
using desafiocarrefour.Services;
using Microsoft.EntityFrameworkCore;
using System;

namespace desafiocarrefour.Tests
{
    public class LancamentoServiceTests
    {
        [Fact]
        public void AdicionaLancamento_DeveSalvarComSucesso()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseInMemoryDatabase(databaseName: "test_db")
                .Options;

            using var context = new AppDbContext(options);
            var service = new LancamentoService(context);
            var lancamento = new Lancamento
            {
                Data = DateTime.Today,
                Valor = 200.00m,
                Tipo = "credito",
                Descricao = "Teste"
            };

            service.Adicionar(lancamento);
            Assert.Single(context.Lancamentos);
        }
    }
}