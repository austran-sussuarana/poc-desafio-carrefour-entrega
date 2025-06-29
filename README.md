# Desafio Carrefour - Backend com .NET 8 + AWS + Terraform

## ✅ Visão Geral
Aplicação .NET 8 hospedada em ECS Fargate com banco de dados PostgreSQL em RDS, provisionada via Terraform e empacotada com Docker.

## 📦 Estrutura
```
├── application/        # Código-fonte da API .NET
├── terraform/          # Infraestrutura como código (Terraform)
├── README.md           # Instruções de uso
├── checklist.pdf       # Checklist de validação
```

## 🚀 Deploy rápido

1. **Buildar e enviar imagem:**
```bash
docker build -t desafiocarrefour .
docker tag desafiocarrefour:latest 886819404756.dkr.ecr.sa-east-1.amazonaws.com/desafiocarrefour:latest
docker push 886819404756.dkr.ecr.sa-east-1.amazonaws.com/desafiocarrefour:latest
```

2. **Executar Terraform:**
```bash
cd terraform
terraform init
terraform apply -var-file=terraform.tfvars
```

3. **Forçar novo deploy:**
```bash
aws ecs update-service \
  --cluster desafio-cluster \
  --service desafiocarrefour-service \
  --force-new-deployment \
  --region sa-east-1
```

## 🌐 Acesso
Swagger disponível em:  
`http://desafiocarrefour-alb-XXXX.sa-east-1.elb.amazonaws.com/swagger/index.html`

## 🧪 Testes
- `POST /Lancamentos`
- `GET /Consolidado?data=YYYY-MM-DD`

## 📋 Banco de Dados
Instância PostgreSQL RDS:
- Host: `desafiocarrefour-postgres.chi46cg80knk.sa-east-1.rds.amazonaws.com`
- User: `dbadmin`
- Password: `password`
- Database: `appdb`

---