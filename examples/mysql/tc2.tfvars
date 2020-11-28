aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-mysql-tc2"
tags       = { env = "dev" }
aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.12"
  port              = "3306"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "5"
  apply_immediately = "false"
}
