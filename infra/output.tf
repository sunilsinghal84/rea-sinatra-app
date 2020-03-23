output "website_url" {
  value       = join("", ["http://", aws_lb.lb.dns_name, "/"])
  description = "website url"
}