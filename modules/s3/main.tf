resource "aws_s3_bucket" "s3_bucket" {
  bucket = "funguardiancsvtodynamodb"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.s3_bucket.id

  topic {
    topic_arn = var.sns_arn
    events    = ["s3:ObjectCreated:*"]
  }
}
