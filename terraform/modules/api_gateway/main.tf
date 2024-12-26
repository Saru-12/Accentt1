# main_api_gateway.tf

# API Gateway Rest API
resource "aws_api_gateway_rest_api" "employee_api" {
  name = "employee-api"
}

# Create a resource within the API (e.g., /employee)
resource "aws_api_gateway_resource" "employee_resource" {
  rest_api_id = aws_api_gateway_rest_api.employee_api.id
  parent_id   = aws_api_gateway_rest_api.employee_api.root_resource_id
  path_part   = "employee"
}

# Define the HTTP method (POST) for the /employee resource
resource "aws_api_gateway_method" "employee_method" {
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  resource_id   = aws_api_gateway_resource.employee_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

# Define the integration (e.g., Lambda or Mock)
resource "aws_api_gateway_integration" "employee_integration" {
  rest_api_id             = aws_api_gateway_rest_api.employee_api.id
  resource_id             = aws_api_gateway_resource.employee_resource.id
  http_method             = aws_api_gateway_method.employee_method.http_method
  integration_http_method = "POST"
  type                    = "MOCK"  # Change this to Lambda or HTTP if needed
}

# Deploy the API to a stage
resource "aws_api_gateway_deployment" "employee_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.employee_api.id
  stage_name  = "prod"

  depends_on = [
    aws_api_gateway_method.employee_method,
    aws_api_gateway_integration.employee_integration
  ]
}

# Output the API Gateway URL
output "api_gateway_url" {
  value       = aws_api_gateway_rest_api.employee_api.invoke_url
  description = "The URL of the deployed API Gateway"
}
