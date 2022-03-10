resource "aws_security_group" "sample" {
  name        = "sample"
  description = "sample"
  vpc_id      = data.terraform_remote_state.my_vpc.outputs.vpc_info

  ingress = [
    {
      description      = "bastion"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      prefix_list_ids  = []
      self             = true
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      security_groups  = ["sg-090ec8c0252e34a1f"]
    }
  ]

  egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      prefix_list_ids  = []
      self             = true
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups  = []
    }
  ]

  tags = {
    Name = "sample"
  }
}

resource "aws_iam_role" "sample" {
  name = "sample"

  assume_role_policy = file("./ec2_assume_role_policy.json")
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "sample" {
  depends_on = [aws_iam_role.sample]
  name       = "sample"
  role       = aws_iam_role.sample.name
}

resource "aws_instance" "sample" {
  depends_on                  = [aws_security_group.sample, aws_iam_instance_profile.sample]
  ami                         = local.ami_id
  associate_public_ip_address = local.associate_public_ip_address
  instance_type               = local.instance_type
  vpc_security_group_ids      = [aws_security_group.sample.id]
  subnet_id                   = local.subnet_id
  iam_instance_profile        = aws_iam_instance_profile.sample.id
  key_name                    = local.key_name
  disable_api_termination     = local.disable_api_termination

  tags = {
    Name = "ExampleAppServerInstance"
  }
  root_block_device {
    volume_size = local.root_vol_size
    volume_type = "gp3"
  }

  lifecycle {
    ignore_changes = [
      associate_public_ip_address,
      instance_state,
      public_dns,
      public_ip,
      disable_api_termination
    ]
  }
}

resource "aws_eip_association" "sample" {
  depends_on    = [aws_instance.sample]
  instance_id   = aws_instance.sample.id
  allocation_id = data.terraform_remote_state.eip.outputs.eip
}
