data "terraform_remote_state" "my_dmz1_subnet" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/dmz1-subnet/terraform.tfstate"
    region = "ap-northeast-1"
  }
}