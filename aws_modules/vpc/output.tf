output "id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.azs.names
}

output "cidr" {
  value = aws_vpc.main.cidr_block
}

output "main_route_table_id" {
  value = aws_vpc.main.main_route_table_id
}