variable "ami_id" {
  type    = string
  default = "ami-00983e8a26e4c9bd9"
}
variable "key_pair_name" {
  type    = string
  default = ""
}
variable "key_pair_id" {
  type    = string
  default = ""
}
variable "subnet_id" {
  type    = string
  default = ""
}
variable "pub_instance_type" {
  type    = string
  default = ""
}
variable "pri_instance_type" {
  type    = string
  default = ""
}
variable "vpc_pubsecurity_group_id" {
    type = set(string)
    default = ["*"]
}
variable "vpc_prisecurity_group_id" {
    type = set(string)
    default = ["*"]
}
variable "pub_instance_name" {
    type = string
    default = "bastion_instance"
}
variable "pri_instance_name" {
    type = string
    default = "private_instance"
}
variable "subnet_pub_sub_ids" {
    type = string
    default = ""
}
variable "subnet_pri_sub_ids" {
    type = string
    default = ""
}
