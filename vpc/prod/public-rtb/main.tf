data "terraform_remote_state" "my_vpc" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/2az_vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "my_igw" {
  backend = "s3"

  config = {
    bucket = "miyashita-tfstate"
    key    = "miyamiyab/terraform-aws/vpc/prod/igw/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_route_table" "my_public_rtb" {
    propagating_vgws = []
    route            = [
        {
            carrier_gateway_id         = ""
            cidr_block                 = "0.0.0.0/0"
            destination_prefix_list_id = ""
            egress_only_gateway_id     = ""
            gateway_id                 = data.terraform_remote_state.my_igw.outputs.igw_id
            instance_id                = ""
            ipv6_cidr_block            = ""
            local_gateway_id           = ""
            nat_gateway_id             = ""
            network_interface_id       = ""
            transit_gateway_id         = ""
            vpc_endpoint_id            = ""
            vpc_peering_connection_id  = ""
        },
    ]
    tags             = {
        "Name" = "public"
    }
    tags_all         = {
        "Name" = "public"
    }
    vpc_id           = data.terraform_remote_state.my_vpc.outputs.vpc_info

    timeouts {}
}