aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-mysql-tc3-custom-pw"
tags       = { test = "tc3" }
aurora_cluster = {
  engine            = "aurora-mysql"
  family            = "aurora-mysql8.0"
  version           = "8.0.mysql_aurora.3.01.0"
  port              = "3306"
  user              = "yourid"
  password          = "supersecret"
  database          = "yourdb"
  backup_retention  = "1"
  apply_immediately = "false"
}
aurora_instances = [
  {
    instance_type = "db.t3.medium"
  },
]
