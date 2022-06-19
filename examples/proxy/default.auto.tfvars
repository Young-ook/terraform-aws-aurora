name       = null
tags       = {}
aws_region = "ap-northeast-2"
vpc_config = {
  azs          = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  cidr         = "10.1.0.0/16"
  subnet_types = "private"
}
aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.mysql_aurora.2.07.1"
  port              = "3306"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
}
aurora_instances = [
  {
    instance_type = "db.t3.medium"
  },
]
