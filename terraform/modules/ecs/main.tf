resource "aws_ecs_task_definition" "app" {
  family                   = "employee-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([{
    name  = "employee-frontend"
    image = var.image_url  # Reference to image_url variable
    portMappings = [
      {
        containerPort = var.container_port  # Reference to container_port variable
        hostPort      = var.container_port
        protocol      = "tcp"
      }
    ]
  }])
}
