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

resource "aws_security_group_rule" "sg-group-rule" {
  type              = var.type
  count             = length(var.ports)
  from_port         = var.ports[count.index]
  to_port           = var.ports[count.index]
  protocol          = var.protocol
  security_group_id = var.security_group_id
  cidr_blocks       = var.cidr_blocks
  description       = var.description
}
