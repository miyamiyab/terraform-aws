data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/eip/prod/commin-eip/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
