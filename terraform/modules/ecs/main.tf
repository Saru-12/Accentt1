resource "aws_ecs_cluster" "main" {
  name = "employee-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "employee-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([
    {
      name  = "employee-frontend"
      image = var.ecr_repository_url  # Reference to ECR URL variable
      portMappings = [
        {
          containerPort = var.container_port  # Reference to container port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  cluster            = aws_ecs_cluster.main.id
  task_definition    = aws_ecs_task_definition.app.arn
  desired_count      = 1
  launch_type        = "FARGATE"
  network_configuration {
    subnets          = ["subnet-abc123"]  # Replace with actual subnet IDs
    assign_public_ip = true
  }
}
