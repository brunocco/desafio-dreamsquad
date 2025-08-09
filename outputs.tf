output "website_url" {
  description = "URL do site hospedado no S3"
  value       = "http://${aws_s3_bucket.meu_bucket.bucket}.s3-website-${var.region}.amazonaws.com"
}
