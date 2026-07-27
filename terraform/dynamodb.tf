resource "aws_dynamodb_table" "idempotency" {
  name         = "eventguardian-idempotency"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  ttl {
    attribute_name = "expiration"
    enabled        = true
  }

  tags = {
    Project     = "EventGuardian"
    Environment = "Dev"
    Owner       = "Sanmathi"
  }
}
