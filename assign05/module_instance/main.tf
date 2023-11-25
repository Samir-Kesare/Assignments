# Instances
resource "aws_instance" "bastion_instance" {
  
  ami           = var.ami_id
  instance_type = var.pub_instance_type
  subnet_id     = var.subnet_pub_sub_ids
  key_name      = var.key_pair_name
  vpc_security_group_ids = var.vpc_pubsecurity_group_id
  tags = {
    Name = var.pub_instance_name
  }
}

resource "aws_instance" "pri_instance" {
 
  ami           = var.ami_id
  instance_type = var.pri_instance_type
  subnet_id     = var.subnet_pri_sub_ids
  key_name      = var.key_pair_name
  vpc_security_group_ids = var.vpc_prisecurity_group_id

  tags = {
    Name = var.pri_instance_name
  }
}
