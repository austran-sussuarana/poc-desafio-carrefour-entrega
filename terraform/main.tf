provider "aws" {
  region = "sa-east-1"
}

resource "aws_ecr_repository" "app" {
  name = "desafiocarrefour"
}

resource "aws_ecs_cluster" "main" {
  name = "desafio-cluster"
}