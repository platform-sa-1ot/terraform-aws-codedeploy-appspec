output "s3_key" {
  description = "The S3 key of the appspec file"
  value       = local.appspec_key
}

output "s3_location" {
  description = "The S3 address of the appspec file"
  value       = "s3://${var.appspec_bucket_name}/${local.appspec_key}"
}

output "s3_id" {
  value = aws_s3_object.appspec.id
}
