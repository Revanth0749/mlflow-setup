output "bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "Name of the artifact bucket"
}

output "bucket_arn" {
  description = "ARN of the artifact bucket"
  value       = aws_s3_bucket.this.arn
}