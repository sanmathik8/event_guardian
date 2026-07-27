resource "aws_cloudwatch_metric_alarm" "dlq_messages" {
  alarm_name        = "eventguardian-dlq-messages"
  alarm_description = "Alert when messages appear in the EventGuardian DLQ"

  namespace   = "AWS/SQS"
  metric_name = "ApproximateNumberOfMessagesVisible"

  statistic           = "Average"
  period              = 60
  evaluation_periods  = 1
  threshold           = 0
  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    QueueName = aws_sqs_queue.dlq.name
  }

  alarm_actions = [
    aws_sns_topic.dlq_alerts.arn
  ]

  tags = {
    Project     = "EventGuardian"
    Environment = "Dev"
    Owner       = "Sanmathi"
  }
}
