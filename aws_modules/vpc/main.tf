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

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge(module.label.tags, tomap({ "Location" = var.vpc_location }))
}

variable "public_support" {
  type = bool
}

module "igw" {
  count  = var.public_support ? 1 : 0
  source = "../internet-gateway"
  vpc_id = aws_vpc.main.id
}

module "igw_route" {
  source = "../route_table"

}
