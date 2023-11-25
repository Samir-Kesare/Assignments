variable "key_pair_name" {
  type    = string
  default = ""
}
variable "public_key" {
    type = string
    default = "tls_private_key.rsa.public_key_openssh"
}