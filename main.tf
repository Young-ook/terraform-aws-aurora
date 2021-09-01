# amazon aurora cluster

# condition
locals {
  enabled           = (var.aurora_cluster != null ? ((length(var.aurora_cluster) > 0) ? true : false) : false)
  compatibility     = (local.enabled ? lookup(var.aurora_cluster, "engine", "aurora-mysql") : "aurora-mysql")
  default_cluster   = (local.compatibility == "aurora-mysql" ? local.default_mysql_cluster : local.default_postgresql_cluster)
  default_instances = (local.compatibility == "aurora-mysql" ? local.default_mysql_instances : local.default_postgresql_instances)
}

# security/password
resource "random_password" "password" {
  count            = local.enabled ? 1 : 0
  length           = 16
  special          = true
  override_special = "^"
}

# subnet group
resource "aws_db_subnet_group" "db" {
  count      = local.enabled ? 1 : 0
  name       = format("%s-db", var.name)
  subnet_ids = local.subnet_ids
  tags       = merge(local.default-tags, var.tags)
}

# parameter groups
resource "aws_rds_cluster_parameter_group" "db" {
  count = local.enabled ? 1 : 0
  name  = format("%s-db-cluster-params", var.name)

  family = lookup(var.aurora_cluster, "family", local.default_cluster["family"])
  dynamic "parameter" {
    for_each = lookup(var.aurora_cluster, "cluster_parameters", local.default_cluster["cluster_parameters"])
    content {
      name  = parameter.key
      value = parameter.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_parameter_group" "db" {
  for_each = { for key, val in var.aurora_instances : key => val }
  name     = format("%s-db-instance-%s-params", var.name, each.key)

  family = lookup(var.aurora_cluster, "family", local.default_cluster["family"])
  dynamic "parameter" {
    for_each = lookup(var.aurora_instances[each.key], "instance_parameters", local.default_instances[0]["instance_parameters"])
    content {
      name  = parameter.key
      value = parameter.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# rds cluster
resource "aws_rds_cluster" "db" {
  count                           = local.enabled ? 1 : 0
  cluster_identifier_prefix       = format("%s-", var.name)
  engine                          = lookup(var.aurora_cluster, "engine", local.default_cluster["engine"])
  engine_mode                     = lookup(var.aurora_cluster, "engine_mode", local.default_cluster["engine_mode"])
  engine_version                  = lookup(var.aurora_cluster, "version", local.default_cluster["version"])
  port                            = lookup(var.aurora_cluster, "port", local.default_cluster["port"])
  skip_final_snapshot             = lookup(var.aurora_cluster, "skip_final_snapshot", local.default_cluster["skip_final_snapshot"])
  database_name                   = lookup(var.aurora_cluster, "database", local.default_cluster["database"])
  master_username                 = lookup(var.aurora_cluster, "user", local.default_cluster["user"])
  master_password                 = random_password.password[0].result
  snapshot_identifier             = lookup(var.aurora_cluster, "snapshot_id", local.default_cluster["snapshot_id"])
  backup_retention_period         = lookup(var.aurora_cluster, "backup_retention", local.default_cluster["backup_retention"])
  db_subnet_group_name            = aws_db_subnet_group.db[0].name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.db[0].name
  vpc_security_group_ids          = coalescelist(aws_security_group.db.*.id, [])
  tags                            = merge(local.default-tags, var.tags)

  lifecycle {
    ignore_changes        = [snapshot_identifier, master_password]
    create_before_destroy = true
  }
}

# rds instances
resource "aws_rds_cluster_instance" "db" {
  for_each                = { for key, val in var.aurora_instances : key => val }
  identifier_prefix       = format("instance-%s-", each.key)
  cluster_identifier      = element(aws_rds_cluster.db.*.id, 0)
  engine                  = lookup(var.aurora_cluster, "engine", local.default_cluster["engine"])
  engine_version          = lookup(var.aurora_cluster, "version", local.default_cluster["version"])
  instance_class          = lookup(each.value, "instance_type", local.default_instances[0]["instance_type"])
  db_parameter_group_name = aws_db_parameter_group.db[each.key].name
  db_subnet_group_name    = aws_db_subnet_group.db[0].name
  apply_immediately       = tobool(lookup(var.aurora_cluster, "apply_immediately", local.default_cluster["apply_immediately"]))
  tags                    = merge(local.default-tags, var.tags)
}
