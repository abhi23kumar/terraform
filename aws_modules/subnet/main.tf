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

resource "aws_subnet" "subnet" {
  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block
  vpc_id            = var.vpc_id
  tags              = module.label.tags
}
