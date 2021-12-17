output "name" {
  description = "The Aurora cluster name"
  value       = module.mysql.cluster.id
}

output "arn" {
  description = "The Aurora cluster arn"
  value       = module.mysql.cluster.arn
}

output "endpoint" {
  description = "The enpoints of Aurora cluster"
  value       = module.mysql.endpoint
}
