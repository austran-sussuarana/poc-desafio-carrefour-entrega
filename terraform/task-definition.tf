resource "aws_ecs_task_definition" "desafio_api" {
  family                   = "desafiocarrefour-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {

      name      = "desafiocarrefour"
      image     = var.ecr_image_url
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80	
          protocol      = "tcp"
        }
      ],
environment = [
  {
    name  = "ConnectionStrings__Default"
    value = "Host=desafiocarrefour-postgres.chi46cg80knk.sa-east-1.rds.amazonaws.com;Port=5432;Username=dbadmin;Password=password;Database=appdb;"
  }
]
    }
  ])
}