# Key Pair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "key-01" {
content  = tls_private_key.rsa.private_key_pem
file_permission = "0400"
filename = "${var.key_pair_name}.pem"
}
