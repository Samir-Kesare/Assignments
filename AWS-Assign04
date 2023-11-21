main.tf:
provider "aws" {
  region = "us-east-1"
}

# VPC
resource "aws_vpc" "ninja_vpc" {
  cidr_block          = var.vpc_cidr
  enable_dns_support  = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Subnets
resource "aws_subnet" "pub_sub" {
  count = length(var.pub_sub_cidr)

  vpc_id                  = aws_vpc.ninja_vpc.id
  cidr_block              = var.pub_sub_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "ninja-pub-sub-${count.index + 1}"
  }
}

resource "aws_subnet" "pri_sub" {
  count = length(var.pri_sub_cidr)

  vpc_id       = aws_vpc.ninja_vpc.id
  cidr_block   = var.pri_sub_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "ninja-priv-sub-${count.index + 1}"
  }
}

# Key Pair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair
  public_key = tls_private_key.rsa.public_key_openssh
}

# Instances
resource "aws_instance" "bastion_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pub_sub[0].id
  key_name      = var.key_pair

  tags = {
    Name = "bastion-instance"
  }
}

resource "aws_instance" "pri_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pri_sub[1].id
  key_name      = var.key_pair

  tags = {
    Name = "private-instance"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ninja_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Elastic IP
resource "aws_eip" "elastic_ip" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.pub_sub[0].id

  tags = {
    Name = var.nat_name
  }
}

# Route Tables
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.ninja_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.pub_route_table_name
  }
}

resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.ninja_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = var.pri_route_table_name
  }
}

# RT Associations
resource "aws_route_table_association" "pub_route_associations" {
  count = length(aws_subnet.pub_sub)

  subnet_id      = aws_subnet.pub_sub[count.index].id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pri_route_associations" {
  count = length(aws_subnet.pri_sub)

  subnet_id      = aws_subnet.pri_sub[count.index].id
  route_table_id = aws_route_table.pri_rt.id
}

variable.tf:

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "ninja-vpc-01"
}

variable "pub_sub_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "pri_sub_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "key_pair" {
  type    = string
  default = "ninja-01"
}

variable "ami_id" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "igw_name" {
  type    = string
  default = "ninja-igw-01"
}

variable "nat_name" {
  type    = string
  default = "ninja-nat-01"
}

variable "pub_route_table_name" {
  type    = string
  default = "ninja-route-pub-01"
}

variable "pri_route_table_name" {
  type    = string
  default = "ninja-route-priv-01"
}

output.tf

# Output VPC ID
output "vpc_id" {
  value = aws_vpc.ninja_vpc.id
}

# Subnet IDs
output "pub_sub_ids" {
  value = aws_subnet.pub_sub[*].id
}

output "pri_sub_ids" {
  value = aws_subnet.pri_sub[*].id
}

# Bastion Instance Public IP
output "bastion_instance_public_ip" {
  value = aws_instance.bastion_instance.public_ip
}

# Private Instance Private IP
output "pri_instance_pri_ip" {
  value = aws_instance.pri_instance.private_ip
}

![image](https://github.com/Samir-Kesare/Assignments/assets/145540651/1b66425a-81ac-4295-b293-2b2971c84464)





