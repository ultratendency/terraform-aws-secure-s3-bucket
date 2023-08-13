provider "aws" {
  region = "eu-central-1"
}

module "terraform_state_s3_bucket" {
  source  = "ultratendency/secure-s3-bucket/aws"
  version = "1.0.1"

  bucket_name = "secure-bucket"

  bucket_lifecycle_configuration_rule_noncurrent_version_expiration_noncurrent_days           = 45
  bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_noncurrent_days     = 15
  bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_storage_class       = "ONEZONE_IA"
  bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_noncurrent_days    = 30
  bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_storage_class      = "GLACIER_IR"
  bucket_lifecycle_configuration_rule_abort_incomplete_multipart_upload_days_after_initiation = 14

  aws_kms_key_enable_key_rotation = false
  aws_kms_key_multi_region        = true

  aws_s3_bucket_public_access_block_block_public_acls       = false
  aws_s3_bucket_public_access_block_block_public_policy     = false
  aws_s3_bucket_public_access_block_ignore_public_acls      = false
  aws_s3_bucket_public_access_block_restrict_public_buckets = false
}
