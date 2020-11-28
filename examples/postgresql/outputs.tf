output "endpoint" {
  description = "The enpoints of Aurora cluster"
  value       = module.postgresql.endpoint
}
