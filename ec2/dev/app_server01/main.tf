module "ec2_instance" {
  source        = "../../../modules/ec2"
  root_vol_size = 20
}