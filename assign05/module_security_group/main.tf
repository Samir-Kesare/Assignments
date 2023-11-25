resource "aws_security_group" "pub_sg_01" {
  vpc_id = var.vpc_id
  name        = var.pub_sg_name
  description = "for EC2 Instances"
  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = ingress_port
    content {
      from_port   = ingress_port.value
      protocol    = "TCP"
      to_port     = ingress_port.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "pri_sg_01" {
  vpc_id = var.vpc_id
  name        = var.pri_sg_name
  description = "for EC2 Instances"

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = ingress_port
    content {
      from_port   = ingress_port.value
      protocol    = "TCP"
      to_port     = ingress_port.value
      cidr_blocks = ["0.0.0.0/0"]
    }
}
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}