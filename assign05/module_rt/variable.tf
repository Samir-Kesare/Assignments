variable "pub_route_table_name" {
  type    = string
  default = "ninja-route-pub-01"
}

variable "pri_route_table_name" {
  type    = string
  default = "ninja-route-priv-01"
}
variable "vpc_id" {
    type = string
    default = ""
}
variable "aws_internet_gateway_id" {
    type = string
    default = ""
}
variable "nat_gateway_id" {
    type = string
    default = ""
}
variable "pub_subnet_id" {
    type = list(string)
    default = ["*"]
}
variable "pri_subnet_id" {
    type = list(string)
    default = ["*"]
}
