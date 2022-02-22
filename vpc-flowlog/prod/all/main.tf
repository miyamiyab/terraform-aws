resource "aws_flow_log" "example" {
  log_destination      = var.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
}

provider "aws" {
  region  = "ap-northeast-1"
}
