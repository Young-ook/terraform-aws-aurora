### output variables

output "cluster" {
  description = "Redis cluster"
  value       = aws_elasticache_replication_group.redis
}
