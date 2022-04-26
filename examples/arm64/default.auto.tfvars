aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidr       = "10.0.0.0/16"
name       = "aurora-arm64-mysql"
tags       = {}
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
