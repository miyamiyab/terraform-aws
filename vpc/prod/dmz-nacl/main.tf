data "terraform_remote_state" "my_vpc" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/2az_vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "my_dmz1_subnet" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/dmz1-subnet/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_network_acl" "my_dmz_nacl" {
    egress     = [
        {
            action          = "allow"
            cidr_block      = "0.0.0.0/0"
            from_port       = 0
            icmp_code       = 0
            icmp_type       = 0
            ipv6_cidr_block = ""
            protocol        = "-1"
            rule_no         = 100
            to_port         = 0
        },
    ]
    ingress    = [
        {
            action          = "allow"
            cidr_block      = "0.0.0.0/0"
            from_port       = 0
            icmp_code       = 0
            icmp_type       = 0
            ipv6_cidr_block = ""
            protocol        = "-1"
            rule_no         = 100
            to_port         = 0
        },
    ]
    subnet_ids = [
        data.terraform_remote_state.my_dmz1_subnet.outputs.my_dmz1_sumbet,
        "subnet-032a65383f5f22851",
        "subnet-06f83cb2982bb4ae2",
    ]
    tags       = {
        "Name" = "DMZ"
    }
    tags_all   = {
        "Name" = "DMZ"
    }
    vpc_id     = data.terraform_remote_state.my_vpc.outputs.vpc_info
}