variable "image_url" {
  description = "The URL of the ECR repository"
  type        = string
}

variable "container_port" {
  description = "The container port to expose"
  type        = number
  default     = 3000  # You can set the default if needed
}
