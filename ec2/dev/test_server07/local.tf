locals {
  ami_id                      = data.aws_ssm_parameter.ami_al2_x86_64_latest.value
  subnet_id                   = data.terraform_remote_state.my_dmz1_subnet.outputs.my_dmz1_sumbet
  instance_type               = "t3.nano"
  root_vol_size               = 10
  associate_public_ip_address = true
  key_name                    = data.terraform_remote_state.key_pair_aws2.outputs.key_pair_id
  disable_api_termination     = true
}
