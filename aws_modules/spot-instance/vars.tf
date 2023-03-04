variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "env" {
  type        = string
  default     = ""
  description = "env, e.g. 'prod', 'staging', 'dev'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. `app` or `jenkins`"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = ({ a = "b" })
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "ami-66a7871c"
}

variable "price" {
  type    = string
  default = "0.016"
}

variable "ami" {
  type    = string
  default = "t3.small"
}

variable "block_duration" {
  type    = number
  default = 120
}

variable "wait_for_fulfillment" {
  type    = bool
  default = true
}

variable "key_name" {
  default = ""
}
