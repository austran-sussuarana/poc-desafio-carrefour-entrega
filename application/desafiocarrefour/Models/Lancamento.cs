using System;

namespace desafiocarrefour.Models
{
    public class Lancamento
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public decimal Valor { get; set; }
        public string Tipo { get; set; } // "credito" ou "debito"
        public string Descricao { get; set; }
    }
}