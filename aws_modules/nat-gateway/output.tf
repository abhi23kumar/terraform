# Output of VPC

output "id" {
  description = "NAT Gateway IDs"
  value = aws_nat_gateway.ngw.id
}