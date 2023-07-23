data "aws_caller_identity" "current" {}

#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "this"
    Statement = [
      {
        Sid       = "HTTPSOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*",
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
    ]
  })
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.this.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.this]

  bucket = aws_s3_bucket.this.id

  rule {
    id = "versioning"

    noncurrent_version_expiration {
      noncurrent_days = var.bucket_lifecycle_configuration_rule_noncurrent_version_expiration_noncurrent_days
    }

    noncurrent_version_transition {
      noncurrent_days = var.bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_noncurrent_days
      storage_class   = var.bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_storage_class
    }

    noncurrent_version_transition {
      noncurrent_days = var.bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_noncurrent_days
      storage_class   = var.bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_storage_class
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = var.bucket_lifecycle_configuration_rule_abort_incomplete_multipart_upload_days_after_initiation
    }

    status = "Enabled"
  }
}

resource "aws_kms_key" "this" {
  description         = "KMS key for S3"
  enable_key_rotation = var.aws_kms_key_enable_key_rotation
  multi_region        = var.aws_kms_key_multi_region

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = aws_s3_bucket.this.bucket
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
          ]
        }
        Action   = "kms:*"
        Resource = "*"
      },
    ]
  })
}

resource "aws_kms_alias" "this" {
  name          = "alias/${aws_s3_bucket.this.bucket}"
  target_key_id = aws_kms_key.this.key_id
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = aws_s3_bucket.this.bucket
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
          ]
        }
        Action   = "kms:*"
        Resource = "*"
      },
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.aws_s3_bucket_public_access_block_block_public_acls
  block_public_policy     = var.aws_s3_bucket_public_access_block_block_public_policy
  ignore_public_acls      = var.aws_s3_bucket_public_access_block_ignore_public_acls
  restrict_public_buckets = var.aws_s3_bucket_public_access_block_restrict_public_buckets
}
