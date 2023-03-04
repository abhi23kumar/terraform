terraform {
  required_version = "~> 1.3.9"
}

module "label" {
  source     = "../labels"
  namespace  = var.namespace
  name       = var.name
  env        = var.env
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = var.public_subnet_id
  subnet_id     = var.eip_gw_id
  tags          = module.label.tags
}
