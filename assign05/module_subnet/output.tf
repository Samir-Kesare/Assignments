# Subnet IDs
output "pub_sub_ids" {
  value = aws_subnet.pub_sub[*].id
}

output "pri_sub_ids" {
  value = aws_subnet.pri_sub[*].id
}
