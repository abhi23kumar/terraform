variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "env" {
  type        = string
  description = "env (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage` and `attributes`"
}

variable "enabled" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = ({a = "b"})
}


#RDS VARIABLES

variable "rds_name" {
  default = ""
}

variable "final_snapshot_identifier" {
  default = ""
}

variable "rds_allocated_storage" {
  type    = number
  default = 100
}

variable "storage_type" {
  default = "gp2"
}

variable "rds_engine" {
  default = ""
}

variable "engine_version" {
  default = ""
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

#These are automated backups
variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "backup_window" {
  default = ""
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "rds_username" {
  default = ""
}

variable "rds_password" {
  default = ""
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
}

variable "multi_az" {
  type    = bool
  default = false
}

#NOTE: PLEASE ONLY PUT THE PRIVATE-SUBNET IDS
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = []
}


variable "vpc_security_group_ids" {
  type = set(string)
}

variable "storage_encrypted" {
  type    = bool
  default = false
}

variable "deletion_protection" {
  type    = bool
  default = true
}
