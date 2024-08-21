output "s3_key" {
  description = "The S3 key of the appspec file"
  value       = local.appspec_key
}

output "s3_location" {
  value = "bucket=${var.appspec_bucket_name},bundleType=YAML,key=${local.appspec_key}"
}

output "s3_id" {
  value = aws_s3_object.appspec.id
}
