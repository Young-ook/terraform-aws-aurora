output "name" {
  description = "The Aurora cluster name"
  value       = module.postgresql.name
}

output "arn" {
  description = "The Aurora cluster arn"
  value       = module.postgresql.arn
}

output "endpoint" {
  description = "The enpoints of Aurora cluster"
  value       = module.postgresql.endpoint
}
