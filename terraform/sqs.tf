resource "aws_sqs_queue" "dlq" {
  name                      = "eventguardian-dlq"
  message_retention_seconds = 1209600
  sqs_managed_sse_enabled   = true

  tags = {
    Project     = "EventGuardian"
    Environment = "Dev"
    Owner       = "Sanmathi"
  }
}

resource "aws_sqs_queue" "events" {
  name                       = "eventguardian-events"
  visibility_timeout_seconds = 180
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3
  })

  tags = {
    Project     = "EventGuardian"
    Environment = "Dev"
    Owner       = "Sanmathi"
  }
}
