output "ids" {
  description = "Private Subnets IDs"
  value       = aws_subnet.subnet.id
}

output "cidr_block" {
  value = aws_subnet.subnet.cidr_block
}

output "az" {
  value = aws_subnet.subnet.availability_zone
}