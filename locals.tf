locals {
  mysql_cluster_parameters = merge(
    map("character_set_server", "utf8", "character_set_client", "utf8"),
    var.mysql_cluster_parameters
  )
}
