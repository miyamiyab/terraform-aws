data "aws_ssm_parameter" "aws_al2_ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ssm_parameter.aws_al2_ami_id.value
  instance_type          = "t3.nano"
  vpc_security_group_ids = ["sg-095b4dbf0ad147006"]
  subnet_id              = "subnet-001c47a47fa6cd265"
  iam_instance_profile   = "test-ec2-role"

  tags = {
    Name = "ExampleAppServerInstance"
  }
  root_block_device {
    volume_size = "21"
    volume_type = "gp3"
  }
}