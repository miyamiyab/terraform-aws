data "terraform_remote_state" "key_pair_aws2" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/ec2-key-pair/prod/aws2/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
