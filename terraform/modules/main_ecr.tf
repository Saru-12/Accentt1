# main_ecr.tf

# ECR Repository for Frontend Docker Image
resource "aws_ecr_repository" "employee_frontend" {
  name = "employee-frontend-repo"
}

# Output the ECR Repository URI
output "ecr_repository_uri" {
  value       = aws_ecr_repository.employee_frontend.repository_url
  description = "The URI of the ECR repository"
}
