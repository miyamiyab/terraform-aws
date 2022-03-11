resource "aws_eip" "sample" {
  network_border_group = "ap-northeast-1"
  public_ipv4_pool     = "amazon"
  tags                 = {}
  tags_all             = {}
  vpc                  = true

  timeouts {}
}
