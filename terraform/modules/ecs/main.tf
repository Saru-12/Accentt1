resource "aws_ecs_cluster" "main" {
  name = "employee-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "employee-app"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = 256
  memory                  = 512

  container_definitions = jsonencode([
    {
      name  = "employee-frontend"
      image = var.image_url
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])
}