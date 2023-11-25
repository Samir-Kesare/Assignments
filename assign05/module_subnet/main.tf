# Subnets
resource "aws_subnet" "pub_sub" {
  count = length(var.pub_sub_cidr)

  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_sub_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "ninja-pub-sub-${count.index + 1}"
  }
}

resource "aws_subnet" "pri_sub" {
  count = length(var.pri_sub_cidr)

  vpc_id       = var.vpc_id
  cidr_block   = var.pri_sub_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "ninja-priv-sub-${count.index + 1}"
  }
}