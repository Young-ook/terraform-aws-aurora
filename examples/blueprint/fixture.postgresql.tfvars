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
