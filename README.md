# Mysql Cluster

## Using module
You can use this module like as below example.

```
odule "your_db" {
  source  = "terraform-aws-mysql"
  version = "v1.0.0"

  app_name        = "mysql"
  stack           = "${var.stack}"
  vpc             = "${module.spin.vpc_id}"
  subnets         = "${module.spin.private_subnets}"
  source_sg       = "${module.spin.node_pool_sg}"
  dns_zone        = "${var.internal_dns_zone}"
  dns_zone_id     = "${module.spin.hosted_zone_id}"
  tags            = "${map("env", "${var.stack}")}"
  mysql_version   = "5.7.12"
  mysql_node_type = "db.r4.large"
}
```
