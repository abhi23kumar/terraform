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

resource "aws_key_pair" "spot_key" {
  key_name   = "spot_key"
  public_key = file("<location of public file>.pub")

  tags = module.label.tags
}
