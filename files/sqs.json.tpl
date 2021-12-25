{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__owner_statement",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${root_id}:root"
      },
      "Action": "SQS:*",
      "Resource": "${sqs_arn}"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sqs:SendMessage",
      "Resource": "${sqs_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${sns_arn}"
        }
      }
    }
  ]
}
