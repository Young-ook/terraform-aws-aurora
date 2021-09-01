aws_region = "ap-northeast-2"
cidrs      = ["10.0.0.0/16"]
name       = "aurora-arm64-mysql-tc2"
tags = {
  env  = "dev"
  test = "tc2"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.mysql_aurora.2.09.2"
  port              = "3306"
  user              = "yourid"
  database          = "yourdb"
  backup_retention  = "5"
  apply_immediately = "false"
  cluster_parameters = {
    character_set_server = "utf8"
    character_set_client = "utf8"
  }
}
aurora_instances = [
  {
    instance_type = "db.r6g.xlarge"
    instance_parameters = {
      autocommit = 0
    }
  }
]
