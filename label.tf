resource "random_string" "iid" {
  for_each = { for k, v in var.aurora_instances : k => v }
  length   = 5
  upper    = false
  lower    = true
  number   = false
  special  = false
}

resource "random_string" "uid" {
  length  = 12
  upper   = false
  lower   = true
  number  = false
  special = false
}

locals {
  service = "rds"
  uid     = join("-", [local.service, random_string.uid.result])
  name    = var.name == null || var.name == "" ? local.uid : var.name
  default-tags = merge(
    { "terraform.io" = "managed" },
    { "Name" = local.name },
  )
}
