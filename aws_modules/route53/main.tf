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

resource "aws_route53_zone" "zone" {
  name = var.zone_name
  tags = module.label.tags
}

resource "aws_route53_record" "route53" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.cname_record
  type    = "CNAME"
  ttl     = "300"
  records = var.cname_record
}
