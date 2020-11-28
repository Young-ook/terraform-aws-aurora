locals {
  default_mysql_cluster = {
    engine              = "aurora-mysql"
    engine_mode         = "provisioned"
    family              = "aurora-mysql5.7"
    version             = "5.7.12"
    port                = "3306"
    database            = "yourdb"
    user                = "yourid"
    skip_final_snapshot = true
    snapshot_id         = null
    backup_retention    = 7
    apply_immediately   = false
    cluster_parameters  = {}
  }
  default_mysql_instances = [
    {
      instance_type       = "db.t3.medium"
      instance_parameters = {}
    }
  ]

  default_postgresql_cluster = {
    engine              = "aurora-postgresql"
    engine_mode         = "provisioned"
    family              = "aurora-postgresql11"
    version             = "11.7"
    port                = "5432"
    database            = "yourdb"
    user                = "yourid"
    skip_final_snapshot = true
    snapshot_id         = null
    backup_retention    = 7
    apply_immediately   = false
    cluster_parameters  = {}
  }
  default_postgresql_instances = [
    {
      instance_type       = "db.t3.medium"
      instance_parameters = {}
    }
  ]
}
