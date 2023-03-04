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

resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  tags   = module.label.tags
}

# HTTP
module "sg-rule" {
  source = "../security-group-rule"
  ports  = [80]
}

#variable "protocol" {
#  type = string
#  default = "tcp"
#}
#
#variable "all_protocol" {
#  default = "-1"
#}
#
#variable "open_cidr" {
#  description = "cidr representing all the cidr"
#  default = "0.0.0.0/0"
#}
#
#resource "aws_security_group_rule" "ingress" {
#  type              = var.type
#  count             = length(var.ports)
#  from_port         = var.ports[count.index]
#  to_port           = var.ports[count.index]
#  protocol          = var.protocol
#  security_group_id = var.security_group_id
#  cidr_blocks       = var.cidr_blocks
#  description       = var.description
#}
#
#resource "aws_security_group_rule" "egress" {
#  type              = "egress"
#  from_port         = 0
#  to_port           = 0
#  protocol          = "all_protocol"
#  cidr_blocks       = var.open_cidr
#  description       = "All egress traffic"
#  security_group_id = aws_security_group.sg.id
#}
#
#resource "aws_security_group_rule" "tcp" {
#  count             = var.tcp_ports == "default_null" ? 0 : length(split(",", var.tcp_ports))
#  type              = "ingress"
#  from_port         = split(",", var.tcp_ports)[count.index]
#  to_port           = split(",", var.tcp_ports)[count.index]
#  protocol          = "tcp"
#  cidr_blocks       =  var.cidrs
#  description       = ""
#  security_group_id = aws_security_group.default.id
#}
