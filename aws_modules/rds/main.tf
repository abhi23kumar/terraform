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

resource "aws_db_instance" "db" {
  identifier                = var.rds_name
  final_snapshot_identifier = "${var.final_snapshot_identifier}-${timestamp()}"
  allocated_storage         = var.rds_allocated_storage
  storage_type              = var.storage_type
  engine                    = var.rds_engine
  engine_version            = var.engine_version
  instance_class            = var.db_instance_class
  backup_retention_period   = var.backup_retention_period
  backup_window             = var.backup_window
  publicly_accessible       = var.publicly_accessible
  username                  = var.rds_username
  password                  = var.rds_password
  vpc_security_group_ids    = var.vpc_security_group_ids
  db_subnet_group_name      = aws_db_subnet_group.rds_instance_subnets.name
  skip_final_snapshot       = var.skip_final_snapshot
  multi_az                  = var.multi_az
  storage_encrypted         = var.storage_encrypted
  deletion_protection       = var.deletion_protection
  tags                      = module.label.tags
}

resource "aws_db_subnet_group" "rds_instance_subnets" {
  name       = var.rds_name
  subnet_ids = var.subnet_ids
  tags       = module.label.tags
}

data "aws_db_snapshot" "db_snapshot" {
  most_recent            = true
  db_instance_identifier = "db-prod"
}
