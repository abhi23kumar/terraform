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

resource "aws_kms_key" "kms-key" {
  deletion_window_in_days = var.deletion_window
  enable_key_rotation     = var.enable_key_rotation
  description             = "This key is used to encrypt bucket objects"
}

resource "aws_kms_alias" "key-alias" {
  name          = var.key_name
  target_key_id = aws_kms_key.kms-key.key_id
}
