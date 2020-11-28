aws_region = "ap-northeast-2"
azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
cidrs      = ["10.0.0.0/16"]
name       = "aurora-postgresql-tc1"
tags       = { env = "dev" }
aurora_cluster = {
  engine            = "aurora-postgresql"
  version           = "11.7"
  port              = "5432"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "1"
  apply_immediately = "false"
}
aurora_instances = [
  {
    instance_type = "db.t3.medium"
  },
  {
    instance_type = "db.t3.medium"
  }
]
