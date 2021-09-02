module "current" {
  source  = "Young-ook/spinnaker/aws//modules/aws-partitions"
  version = ">= 2.0"
}

resource "aws_iam_role" "fis-run" {
  name = join("-", [var.name, "fis-run"])
  tags = merge(local.default-tags, var.tags)
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = [format("fis.%s", module.current.partition.dns_suffix)]
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "fis-run" {
  policy_arn = format("arn:%s:iam::aws:policy/PowerUserAccess", module.current.partition.partition)
  role       = aws_iam_role.fis-run.id
}

### fault injection simulator experiment templates

resource "local_file" "failover-db-cluster" {
  content = templatefile("${path.module}/templates/failover-db-cluster.tpl", {
    alarm   = aws_cloudwatch_metric_alarm.rds-cpu.arn
    role    = aws_iam_role.fis-run.arn
    region  = var.aws_region
    cluster = module.mysql.arn.0
  })
  filename        = "${path.module}/.fis/failover-db-cluster.json"
  file_permission = "0600"
}

resource "local_file" "reboot-db-instances" {
  content = templatefile("${path.module}/templates/reboot-db-instances.tpl", {
    alarm  = aws_cloudwatch_metric_alarm.rds-cpu.arn
    role   = aws_iam_role.fis-run.arn
    region = var.aws_region
    db     = module.mysql.instances.0.arn
  })
  filename        = "${path.module}/.fis/reboot-db-instances.json"
  file_permission = "0600"
}

resource "local_file" "create-fis-templates" {
  content = templatefile("${path.module}/templates/create-fis-templates.tpl", {
    region = var.aws_region
  })
  filename        = "${path.module}/.fis/create-fis-templates.sh"
  file_permission = "0700"
}

resource "null_resource" "create-fis-templates" {
  depends_on = [
    local_file.failover-db-cluster,
    local_file.reboot-db-instances,
    local_file.create-fis-templates,
  ]
  provisioner "local-exec" {
    when    = create
    command = "cd ${path.module}/.fis && bash create-fis-templates.sh"
  }
}

resource "local_file" "delete-fis-templates" {
  content = templatefile("${path.module}/templates/delete-fis-templates.tpl", {
    region = var.aws_region
  })
  filename        = "${path.module}/.fis/delete-fis-templates.sh"
  file_permission = "0700"
}

resource "null_resource" "delete-fis-templates" {
  depends_on = [
    local_file.failover-db-cluster,
    local_file.reboot-db-instances,
    local_file.delete-fis-templates,
  ]
  provisioner "local-exec" {
    when    = destroy
    command = "cd ${path.module}/.fis && bash delete-fis-templates.sh"
  }
}
