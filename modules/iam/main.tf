resource "aws_iam_role" "iam_role" {
  name = "csvtodynamodb"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    tag-key = "csvtodynamodb"
  }
}

resource "aws_iam_policy" "iam_policy" {
  name        = "csvtodynamodb"
  path        = "/"
  description = "csvtodynamodb"
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
