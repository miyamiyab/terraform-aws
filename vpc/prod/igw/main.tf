data "terraform_remote_state" "my_vpc" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/2az_vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_internet_gateway" "igw" {
  tags     = {}
  tags_all = {}
  vpc_id   = data.terraform_remote_state.my_vpc.outputs.vpc_info
}