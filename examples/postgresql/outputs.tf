output "name" {
  description = "The Aurora cluster name"
  value       = module.postgresql.cluster.id
}

output "arn" {
  description = "The Aurora cluster arn"
  value       = module.postgresql.cluster.arn
}

output "endpoint" {
  description = "The enpoints of Aurora cluster"
  value       = module.postgresql.endpoint
}
