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
variable "pub_sg_name" {
    type = string
    default = "public_security_group"
}

variable "pri_sg_name" {
    type = string
    default = "private_security_group"
}
variable "ingress_ports" {
    type = list(number)
    default = ["80","22"]
}
variable "ami_id" {
  type    = string
  default = "ami-00983e8a26e4c9bd9"
}
variable "key_pair_name" {
  type    = string
  default = "vergenia"
}
variable "pub_instance_name" {
    type = string
    default = "bastion_instance"
}
variable "pri_instance_name" {
    type = string
    default = "private_instance"
}
variable "public_key" {
    type = string
    default = "tls_private_key.rsa.public_key_openssh"
}
variable "pub_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "pri_instance_type" {
  type    = string
  default = "t2.micro"
}