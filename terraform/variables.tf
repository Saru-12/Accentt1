variable "aws_region" {
  default = "us-east-1"
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  default     = "<ECR_URL>"
}

variable "container_port" {
  description = "The container port to expose"
  type        = number
  default     = 3000  
}

