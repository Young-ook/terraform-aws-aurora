# outputs.tf

output "endpoint" {
  value = aws_route53_record.db.name
}
