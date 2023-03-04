output "eip_ngw_id" {
  description = "Elastic ID"
  value = aws_eip.eip.id
}

output "eip_gw_id" {
  value = aws_eip.eip.id
}