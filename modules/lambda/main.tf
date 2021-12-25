resource "aws_lambda_event_source_mapping" "lambda_event_source_mapping" {
  event_source_arn = var.sqs_arn
  function_name    = var.lambda_arn
}
