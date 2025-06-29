output "postgres_endpoint" {
  value = aws_db_instance.postgres.endpoint
  description = "Endpoint da instância PostgreSQL"
}