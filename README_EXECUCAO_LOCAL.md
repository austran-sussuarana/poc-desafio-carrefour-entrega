# 🖥️ Execução Local da Aplicação - Desafio Carrefour

Este guia descreve como executar o projeto **localmente** com Docker **ou** via .NET CLI.

---

## ✅ Requisitos

- [.NET SDK 8.0](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Git (opcional para versionamento)

---

## Opção 1: Executar com Docker

### 1. Subir banco PostgreSQL com Docker Compose:

```bash
docker-compose up -d
```

> Cria container PostgreSQL com:
> - Database: `appdb`
> - Username: `postgres`
> - Password: `postgres`

### 2. Build da aplicação

```bash
docker build -t desafiocarrefour .
```

### 3. Executar container

```bash
docker run -p 8080:80 --env ASPNETCORE_ENVIRONMENT=Development desafiocarrefour
```

### 4. Acessar no navegador:

```
http://localhost:8080/swagger
```

---

##  Opção 2: Executar com .NET CLI (modo manual)

### 1. Rodar banco PostgreSQL com Docker

```bash
docker-compose up -d
```

### 2. Configurar string de conexão

Verifique se em `appsettings.Development.json` ou `Program.cs` há algo como:

```json
"ConnectionStrings": {
  "DefaultConnection": "Host=localhost;Port=5432;Database=appdb;Username=postgres;Password=postgres"
}
```

### 3. Restaurar e rodar projeto

```bash
cd application/desafiocarrefour
dotnet restore
dotnet build
dotnet run
```

### 4. Acessar a aplicação

- https://localhost:5001/swagger
- ou http://localhost:5000/swagger

---

##  Script SQL (criar a tabela manualmente)

```sql
CREATE TABLE lancamentos (
    id SERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    descricao TEXT
);
```

---

