output "name" {
  description = "The Aurora cluster name"
  value       = module.mysql.name
}

output "arn" {
  description = "The Aurora cluster arn"
  value       = module.mysql.arn
}

output "endpoint" {
  description = "The enpoints of Aurora cluster"
  value       = module.mysql.endpoint
}
