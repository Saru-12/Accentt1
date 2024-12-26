provider "aws" {
  region = var.aws_region
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "lambda" {
  source = "./modules/lambda"
  depends_on = [module.dynamodb]
}

module "api_gateway" {
  source = "./modules/api_gateway"
  depends_on = [module.lambda]
}

module "ecs" {
  source = "./modules/ecs"

  image_url      = var.ecr_repository_url
  container_port = var.container_port
}
