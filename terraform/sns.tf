resource "aws_sns_topic" "dlq_alerts" {
  name = "eventguardian-dlq-alerts"

  tags = {
    Project     = "EventGuardian"
    Environment = "Dev"
    Owner       = "Sanmathi"
  }
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.dlq_alerts.arn
  protocol  = "email"
  endpoint  = var.budget_alert_email
}
