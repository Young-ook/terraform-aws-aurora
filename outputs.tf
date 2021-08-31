# output variables

output "name" {
  description = "The Aurora cluster name"
  value       = aws_rds_cluster.db.*.id
}

output "arn" {
  description = "The Aurora cluster arn"
  value       = aws_rds_cluster.db.*.arn
}

output "endpoint" {
  description = "The endpoints of Aurora cluster"
  value = (local.enabled ? zipmap(
    ["writer", "reader"],
    [aws_rds_cluster.db.*.endpoint, aws_rds_cluster.db.*.reader_endpoint]
  ) : null)
}
