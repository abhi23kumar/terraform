 variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
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

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = ({ a = "b" })
}

variable "user_name" {
  type = string
  description = "username of the user"
}

variable "path" {
  type = string
  default = "/system/"
  description = "path of the "
}

variable "encoding" {
  type = string
  default = "PEM"
}

variable "public_key" {
  type = string
  default = "~/.ssh/id_rsa_personal.pub"
  description = "public key to which access should be granted"
}