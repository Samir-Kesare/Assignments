output "vpc_pubsecurity_group_id" {
    value = aws_security_group.pub_sg_01.id
}
output "vpc_prisecurity_group_id" {
    value = aws_security_group.pri_sg_01.id
}
