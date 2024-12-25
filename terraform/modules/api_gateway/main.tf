resource "aws_api_gateway_rest_api" "employee_api" {
  name = "employee-api"
}

resource "aws_api_gateway_resource" "employee_resource" {
  rest_api_id = aws_api_gateway_rest_api.employee_api.id
  parent_id   = aws_api_gateway_rest_api.employee_api.root_resource_id
  path_part   = "employee"
}

resource "aws_api_gateway_method" "employee_method" {
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  resource_id   = aws_api_gateway_resource.employee_resource.id
  http_method   = "POST"
  authorization = "NONE"
}