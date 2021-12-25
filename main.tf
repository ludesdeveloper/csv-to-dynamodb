provider "aws" {
  region     = var.region
}
module "bucket" {
  source  = "./modules/s3"
  sns_arn = module.sns.arn
}
module "sns" {
  source  = "./modules/sns"
  s3_arn  = module.bucket.arn
  sqs_arn = module.sqs.arn
}
data "template_file" "sqs" {
  template = file("files/sqs.json.tpl")
  vars = {
    sqs_arn = module.sqs.arn
    sns_arn = module.sns.arn
    root_id = var.root_id
  }
}
module "sqs" {
  source  = "./modules/sqs"
  sns_arn = module.sns.arn
  policy  = data.template_file.sqs.rendered
}
module "dynamodb" {
  source = "./modules/dynamodb"
}
