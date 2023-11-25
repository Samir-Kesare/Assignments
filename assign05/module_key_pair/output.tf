output "key_pair_id" {
    value = aws_key_pair.key_pair.key_pair_id
}
output "key_pair_name" {
    value = aws_key_pair.key_pair.id
}