variable "ecr_image_url" {
  type        = string
  description = "URL da imagem Docker publicada no Amazon ECR"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}