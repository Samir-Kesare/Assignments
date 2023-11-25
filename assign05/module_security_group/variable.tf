variable "ingress_ports" {
    type = list(number)
    default = ["80","22"]
}
variable "vpc_id" {
    type = string
    default = ""
}

variable "pub_sg_name" {
    type = string
    default = "public_security_group"
}

variable "pri_sg_name" {
    type = string
    default = "private_security_group"
}
