output "bucket_policy_id" {
  description = "ID of the bucket policy"
  value       = aws_s3_bucket_policy.website_bucket_policy.id
}
