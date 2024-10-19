output "s3_bucket_name" {
  value = aws_s3_bucket.documents_bucket.bucket
}

output "db_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}

output "instance_ip" {
  value = aws_instance.app_instance.public_ip
}
