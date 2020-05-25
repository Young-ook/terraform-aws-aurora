# Mysql Cluster

## Using module
You can use this module like as below example.

```
module "mysql" {
  source  = "tf-mod/mysql/aws"
  version = "1.0.0"

  name            = "mysql"
  stack           = var.stack
  vpc             = module.vpc.id
  subnets         = module.vpc.private_subnets
  source_sg       = var.src_sg_id
  dns_zone        = var.dns_zone
  dns_zone_id     = var.dns_zone_id
  tags            = { "env" = "dev" }
  mysql_version   = "5.7.12"
  mysql_node_type = "db.r4.large"
}
```
