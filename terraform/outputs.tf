output "event_queue_url" {
  value = aws_sqs_queue.events.url
}

output "dlq_url" {
  value = aws_sqs_queue.dlq.url
}

output "processed_bucket" {
  value = aws_s3_bucket.processed.bucket
}
