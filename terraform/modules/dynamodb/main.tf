# main_dynamodb.tf

# DynamoDB Table for Employee Info
resource "aws_dynamodb_table" "employee_table" {
  name           = "EmployeeInfo"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "employeeId"

  attribute {
    name = "employeeId"
    type = "S"
  }

  tags = {
    Environment = "production"
  }
}

# Output the DynamoDB Table ARN
output "table_arn" {
  value       = aws_dynamodb_table.employee_table.arn
  description = "The ARN of the DynamoDB table"
}
