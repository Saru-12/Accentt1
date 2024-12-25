provider "aws" {
  region = var.aws_region
}

module "dynamodb" {
  source = "./modules/dynamodb"
  table_name = "EmployeeInfo"
}

module "lambda" {
  source = "./modules/lambda"
  function_name = "employee-handler"
  handler = "index.handler"
  runtime = "nodejs16.x"
  source_path = "../lambda/employee_handler"
  dynamodb_table_arn = module.dynamodb.table_arn
}

module "api_gateway" {
  source = "./modules/api_gateway"
  name = "employee-api"
  lambda_function_arn = module.lambda.function_arn
  lambda_function_name = module.lambda.function_name
}

module "ecs" {
  source = "./modules/ecs"
  app_name = "employee-frontend"
  container_port = 3000
  image_url = "${var.ecr_repository_url}:latest"
}