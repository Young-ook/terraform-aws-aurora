output "rds" {
  description = "Aurora cluster"
  value       = module.rds.cluster
  sensitive   = true
}

output "endpoint" {
  description = "Aurora cluster endpoints"
  value       = module.rds.endpoint
}

output "proxy" {
  description = "RDS proxy"
  value       = module.proxy.proxy
}
