# rds.tf
# relational database service

### security/firewall
resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "^"
}

resource "aws_security_group" "db" {
  name        = format("%s-db", local.name)
  description = format("security group for %s-db", local.name)
  vpc_id      = var.vpc

  tags = merge(map("Name", format("%s-db", local.name)), var.tags)
}

resource "aws_security_group_rule" "db-ingress-rules" {
  type                     = "ingress"
  from_port                = var.mysql_port
  to_port                  = var.mysql_port
  protocol                 = "tcp"
  source_security_group_id = var.source_sg
  security_group_id        = aws_security_group.db.id
}

### subnet group
resource "aws_db_subnet_group" "db" {
  name       = format("%s-db", local.name)
  subnet_ids = var.subnets
  tags       = merge(map("Name", format("%s-db", local.name)), var.tags)
}

### parameter groups
resource "aws_rds_cluster_parameter_group" "db" {
  name = format("%s-db-cluster-params", local.name)

  family = format("aurora-mysql%s.%s",
    element(split(".", var.mysql_version), 0),
    element(split(".", var.mysql_version), 1)
  )

  dynamic parameter {
    iterator = parameter
    for_each = local.mysql_cluster_parameters

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
  name = format("%s-db-params", local.name)

  family = format("aurora-mysql%s.%s",
    element(split(".", var.mysql_version), 0),
    element(split(".", var.mysql_version), 1)
  )

  lifecycle {
    create_before_destroy = true
  }
}

### rds (aurora)
resource "aws_rds_cluster" "db" {
  cluster_identifier_prefix       = format("%s-", local.cluster-id)
  engine                          = "aurora-mysql"
  engine_version                  = var.mysql_version
  engine_mode                     = "provisioned"
  port                            = var.mysql_port
  skip_final_snapshot             = "true"
  database_name                   = var.mysql_db
  master_username                 = var.mysql_master_user
  master_password                 = random_string.password.result
  snapshot_identifier             = var.mysql_snapshot
  backup_retention_period         = "5"
  db_subnet_group_name            = aws_db_subnet_group.db.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.db.name
  vpc_security_group_ids          = [aws_security_group.db.id]
  tags                            = merge(map("Name", format("%s-db", local.name)), var.tags)

  lifecycle {
    ignore_changes        = [snapshot_identifier, master_password]
    create_before_destroy = true
  }
}

### instances
resource "aws_rds_cluster_instance" "db" {
  count = var.mysql_node_count

  identifier              = format("%s-%d", local.cluster-id, count.index)
  cluster_identifier      = aws_rds_cluster.db.id
  instance_class          = var.mysql_node_type
  engine                  = "aurora-mysql"
  engine_version          = var.mysql_version
  db_parameter_group_name = aws_db_parameter_group.db.name
  db_subnet_group_name    = aws_db_subnet_group.db.name
  apply_immediately       = var.apply_immediately
}

### dns records
resource "aws_route53_record" "db" {
  zone_id = var.dns_zone_id
  name    = format("%s-db.%s", local.cluster-id, var.dns_zone)
  type    = "CNAME"
  ttl     = 300
  records = coalescelist(aws_rds_cluster.db.*.endpoint, list(""))
}
