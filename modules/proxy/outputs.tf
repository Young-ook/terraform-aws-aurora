# output variables

output "proxy" {
  description = "Attributes of the generated rds proxy"
  value       = aws_db_proxy.proxy
}
