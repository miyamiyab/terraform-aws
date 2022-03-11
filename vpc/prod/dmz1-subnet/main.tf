data "terraform_remote_state" "my_vpc" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/2az_vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_subnet" "dmz1_sumbet" {
  assign_ipv6_address_on_creation                = false
  availability_zone_id                           = "apne1-az4"
  cidr_block                                     = "10.0.0.0/24"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "dmz1"
  }
  tags_all = {
    "Name" = "dmz1"
  }
  vpc_id = data.terraform_remote_state.my_vpc.outputs.vpc_info

  timeouts {}
}