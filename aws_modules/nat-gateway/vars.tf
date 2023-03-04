variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "env" {
  type        = string
  default     = ""
  description = "env, e.g. 'dev', 'qa', 'pp', 'load', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "private network name"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `env`, `name` and `attributes`"
}

variable "tags" {
  type        = map(string)
  default     = ({a = "b"})
  description = "Additional tags (e.g. `map('purpose','XYZ')`"
}

variable "eip_gw_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}
