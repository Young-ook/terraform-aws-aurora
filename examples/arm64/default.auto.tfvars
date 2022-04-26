aws_region = "ap-northeast-2"
cidrs      = ["10.0.0.0/16"]
name       = "aurora-arm64-mysql"
aurora_cluster = {
  engine           = "aurora-mysql"
  version          = "5.7.mysql_aurora.2.09.2"
  port             = "3306"
  user             = "yourid"
  database         = "yourdb"
  backup_retention = "5"
}
aurora_instances = [
  {
    instance_type = "db.r6g.large"
  }
]
