terraform {
  required_version = "~> 1.3.9"
}

locals {
  original_tags    = join(var.delimiter, compact(concat(tolist([var.namespace, var.env, var.name]), var.attributes)))
  transformed_tags = lower(local.original_tags)
}

locals {
  id = local.transformed_tags

  name       = lower(format("%v", var.name))
  namespace  = lower(format("%v", var.namespace))
  env        = lower(format("%v", var.env))
  delimiter  = lower(format("%v", var.delimiter))
  attributes = lower(format("%v", join(var.delimiter, compact(var.attributes))))

  tags = merge(
    {
      "name"       = local.name
      "namespace"  = local.namespace
      "env"        = local.env
      "attributes" = local.attributes
    },
    var.tags
  )
}
