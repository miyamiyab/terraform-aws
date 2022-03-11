resource "aws_security_group" "BastionFromMyhome" {
  description = "Restrict login route with ssh."
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]
  ingress = [
    {
      cidr_blocks = [
        "10.0.0.0/16",
      ]
      description      = "squid"
      from_port        = 3128
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 3128
    },
    {
      cidr_blocks = [
        "113.43.220.206/32",
      ]
      description      = "ks"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = [
        "113.43.220.206/32",
      ]
      description      = "ks"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks = [
        "113.43.220.206/32",
      ]
      description      = "ks"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks = [
        "210.229.74.175/32",
        "106.154.135.39/32",
        "111.239.165.56/32",
        "124.142.150.172/32",
        "10.0.0.0/16",
      ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = [
        "210.229.74.175/32",
        "111.239.165.56/32",
        "124.142.150.172/32",
      ]
      description      = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks = [
        "210.229.74.175/32",
        "111.239.165.56/32",
        "124.142.150.172/32",
      ]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-02cdc61ba930fda45",
      ]
      self    = false
      to_port = 80
    },
    {
      cidr_blocks      = []
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = true
      to_port          = 0
    },
  ]
  name = "BastionFromMyhome"
  tags = {
    "Name" = "Bastion"
  }
  tags_all = {
    "Name" = "Bastion"
  }
  vpc_id = "vpc-05b44d66bb4de7b34"

  timeouts {}
}