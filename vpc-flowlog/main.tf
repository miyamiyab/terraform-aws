resource "aws_flow_log" "example" {
  log_destination      = var.s3_bucket_name.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc.id
}

provider "aws" {
  region  = "ap-northeast-1"
}
