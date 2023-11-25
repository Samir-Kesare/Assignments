# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = var.elastic_ip
  subnet_id     = var.subnet_id

  tags = {
    Name = var.nat_name
  }
}