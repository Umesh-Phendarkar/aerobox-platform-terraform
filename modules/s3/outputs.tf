output "uploads_bucket_name" {
  value = aws_s3_bucket.uploads.id
}

output "logs_bucket_name" {
  value = aws_s3_bucket.logs.id
}
