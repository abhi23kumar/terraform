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

variable "ports" {
  type = list(number)
}

variable "cidr_blocks" {
  type = list(string)
  default = []
}

variable "security_group_id" {
  type = string
  default = ""
}

variable "type" {
  type = string
  default = ""
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "description" {
  type = string
  default = ""
}