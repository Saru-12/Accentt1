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

output "table_arn" {
  value = aws_dynamodb_table.employee_table.arn
}