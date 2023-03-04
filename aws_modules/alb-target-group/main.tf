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

resource "aws_lb_target_group" "alb-tg" {
  name     = var.alb_tg_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
}
