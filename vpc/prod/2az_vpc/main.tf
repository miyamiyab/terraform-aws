resource "aws_vpc" "my_vpc" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.0.0.0/16"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = "2az_vpc"
  }
  tags_all = {
    "Name" = "2az_vpc"
  }
}

output "vpc_info" {
  value = aws_vpc.my_vpc.id
}