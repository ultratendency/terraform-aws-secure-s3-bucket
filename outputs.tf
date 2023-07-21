# aws_s3_bucket outputs
output "aws_s3_bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "aws_s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

# aws_s3_bucket_server_side_encryption_configuration outputs
output "aws_s3_bucket_server_side_encryption_configuration_id" {
  description = "The ID of the S3 bucket server-side encryption configuration"
  value       = aws_s3_bucket_server_side_encryption_configuration.this.id
}

# aws_s3_bucket_versioning outputs
output "aws_s3_bucket_versioning_id" {
  description = "The ID of the S3 bucket versioning"
  value       = aws_s3_bucket_versioning.this.id
}

# aws_s3_bucket_lifecycle_configuration outputs
output "aws_s3_bucket_lifecycle_configuration_id" {
  description = "The ID of the S3 bucket lifecycle configuration"
  value       = aws_s3_bucket_lifecycle_configuration.this.id
}

# aws_kms_key outputs
output "aws_kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.this.arn
}

output "aws_kms_key_key_id" {
  description = "The key ID of the KMS key"
  value       = aws_kms_key.this.key_id
}

# aws_kms_alias outputs
output "aws_kms_alias_arn" {
  description = "The ARN of the KMS key alias"
  value       = aws_kms_alias.this.arn
}

output "aws_kms_alias_target_key_arn" {
  description = "The ARN of the target key ID"
  value       = aws_kms_alias.this.target_key_arn
}

# aws_s3_bucket_public_access_block outputs
output "aws_s3_bucket_public_access_block_id" {
  description = "The ID of the S3 bucket public access block"
  value       = aws_s3_bucket_public_access_block.this.id
}
