# output variables

output "endpoint" {
  description = "The endpoints of Aurora cluster"
  value = (local.enabled ? zipmap(
    ["writer", "reader"],
    [aws_rds_cluster.db.*.endpoint, aws_rds_cluster.db.*.reader_endpoint]
  ) : null)
}
