resource "random_string" "iid" {
  for_each = { for k, v in var.aurora_instances : k => v }
  length   = 5
  upper    = false
  lower    = true
  numeric  = false
  special  = false
}

### frigga name
module "frigga" {
  source  = "Young-ook/spinnaker/aws//modules/frigga"
  version = "2.3.5"
  name    = var.name == null || var.name == "" ? "rds" : var.name
  petname = var.name == null || var.name == "" ? true : false
}

locals {
  name = module.frigga.name
  default-tags = merge(
    { "terraform.io" = "managed" },
    { "Name" = local.name },
  )
}
