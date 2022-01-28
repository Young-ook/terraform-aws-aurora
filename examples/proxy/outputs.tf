output "user" {
  description = "Master user credential for aurora cluster"
  value       = module.mysql.user
  sensitive   = true
}

output "cluster" {
  description = "Aurora cluster identifier"
  value       = module.mysql.cluster.id
}

output "proxy" {
  description = "Attributes of the generated rds proxy"
  value       = module.proxy.proxy
}
