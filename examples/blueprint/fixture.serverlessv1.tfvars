aurora_cluster = {
  engine            = "aurora-mysql"
  version           = "5.7.mysql_aurora.2.08.3"
  mode              = "serverless"
  user              = "yourid"
  database          = "yourdb"
  apply_immediately = "false"
  scaling = {
    max_capacity = 128
    min_capacity = 2
  }
}
aurora_instances = []
