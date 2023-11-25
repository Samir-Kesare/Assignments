# Route Tables
resource "aws_route_table" "pub_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_internet_gateway_id
  }
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = var.pub_route_table_name
  }
}

resource "aws_route_table" "pri_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = var.pri_route_table_name
  }
}

# RT Associations
resource "aws_route_table_association" "pub_route_associations" {
  count = length(var.pub_subnet_id)

  subnet_id      = var.pub_subnet_id[count.index]
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pri_route_associations" {
  count = length(var.pri_subnet_id)

  subnet_id      = var.pri_subnet_id[count.index]
  route_table_id = aws_route_table.pri_rt.id
}