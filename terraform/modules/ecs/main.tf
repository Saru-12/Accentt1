# main_ecs.tf

# ECS Task Definition for Employee App (Frontend)
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

# Output the ECS Task Definition ARN
output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = "The ARN of the ECS task definition"
}
