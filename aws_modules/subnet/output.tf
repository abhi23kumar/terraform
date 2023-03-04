output "id" {
  description = "Private Subnets IDs"
  value       = aws_subnet.subnet.id
}

output "cidr_block" {
  description = "Private Subnets IDs"
  value       = aws_subnet.subnet.cidr_block
}
