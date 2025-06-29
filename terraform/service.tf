resource "aws_ecs_service" "desafio_service" {
  name            = "desafiocarrefour-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.desafio_api.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "desafiocarrefour"   # 👈 mesmo nome do container no task-definition
    container_port   = 80
  }

  depends_on = [aws_lb_listener.http]
}
