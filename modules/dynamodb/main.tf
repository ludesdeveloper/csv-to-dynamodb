resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "csvtodynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "name"
  attribute {
    name = "name"
    type = "S"
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
