# aws_s3_bucket variables
variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

# aws_s3_bucket_lifecycle_configuration variables
variable "bucket_lifecycle_configuration_rule_noncurrent_version_expiration_noncurrent_days" {
  type        = number
  description = "(optional) Number of days an object is noncurrent before Amazon S3 can perform the associated action"
  default     = 90
}

variable "bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_noncurrent_days" {
  type        = number
  description = "(optional) The number of days noncurrent object versions transition during the first transition"
  default     = 30
}

variable "bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_storage_class" {
  type        = string
  description = "(optional) The Amazon S3 storage class to which the object should be transitioned during the first transition"
  default     = "STANDARD_IA"
}

variable "bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_noncurrent_days" {
  type        = number
  description = "(optional) The number of days noncurrent object versions transition during the second transition"
  default     = 60
}

variable "bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_storage_class" {
  type        = string
  description = "(optional) The Amazon S3 storage class to which the object should be transitioned during the second transition"
  default     = "GLACIER"
}

variable "bucket_lifecycle_configuration_rule_abort_incomplete_multipart_upload_days_after_initiation" {
  type        = number
  description = "(optional) Number of days after which Amazon S3 aborts an incomplete multipart upload"
  default     = 7
}

# aws_kms_key variables
variable "aws_kms_key_enable_key_rotation" {
  type        = bool
  description = "(optional) Indicates whether key rotation is enabled"
  default     = true
}

variable "aws_kms_key_multi_region" {
  type        = bool
  description = "(optional) Indicates whether the KMS key is a multi-region or regional key"
  default     = false
}

# aws_s3_bucket_public_access_block variables
variable "aws_s3_bucket_public_access_block_block_public_acls" {
  type        = bool
  description = "(optional) Indicates whether Amazon S3 should block public ACLs for this bucket"
  default     = true
}

variable "aws_s3_bucket_public_access_block_block_public_policy" {
  type        = bool
  description = "(optional) Indicates whether Amazon S3 should block public bucket policies for this bucket"
  default     = true
}

variable "aws_s3_bucket_public_access_block_ignore_public_acls" {
  type        = bool
  description = "(optional) Indicates whether Amazon S3 should ignore public ACLS for this bucket"
  default     = true
}

variable "aws_s3_bucket_public_access_block_restrict_public_buckets" {
  type        = bool
  description = "(optiona) Indicates whether Amazon S3 should restrict public bucket policies for this bucket"
  default     = true
}
