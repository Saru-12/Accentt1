resource "aws_ecs_cluster" "main" {
  name = "employee-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "employee-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([{
    name  = "employee-frontend"
    image = var.image_url  # Use the image_url variable passed at runtime
    portMappings = [
      {
        containerPort = var.container_port
        hostPort      = var.container_port
        protocol      = "tcp"
      }
    ]
  }])
}

resource "aws_ecs_service" "app" {
  cluster            = aws_ecs_cluster.main.id
  task_definition    = aws_ecs_task_definition.app.arn
  desired_count      = 1
  launch_type        = "FARGATE"
  network_configuration {
    subnets          = ["subnet-abc123", "subnet-def456"]  # Replace with actual subnet IDs
    assign_public_ip = true
    security_groups  = ["sg-12345678"]  # Replace with the actual security group ID
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn  # Optional: Only if you're using ALB
    container_name   = "employee-frontend"
    container_port   = var.container_port
  }

  depends_on = [aws_ecs_task_definition.app]
}
