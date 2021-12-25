resource "aws_sqs_queue" "sqs_queue" {
  name                      = "csvtodynamodb"
  delay_seconds             = 0
  max_message_size          = 256000
  message_retention_seconds = 86400
  receive_wait_time_seconds = 0

  tags = {
    Environment = "production"
  }
}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id
  policy    = var.policy
}
