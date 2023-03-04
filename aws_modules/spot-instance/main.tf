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

resource "aws_spot_instance_request" "spot" {
  ami                    = var.ami
  spot_price             = var.price
  instance_type          = var.instance_type
  block_duration_minutes = var.block_duration
  wait_for_fulfillment   = var.wait_for_fulfillment
  key_name               = var.key_name
  security_groups        = var.security_groups
  subnet_id              = var.subnet_id
  tags                   = module.label.tags
}
