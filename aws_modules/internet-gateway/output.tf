# Output of VPC

output "id" {
  description = "The ID of the VPC"
  value       = aws_internet_gateway.igw.id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.azs.names
}