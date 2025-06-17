# AWS Secure S3 Terraform module

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=ultratendency_terraform-aws-secure-s3-bucket&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=ultratendency_terraform-aws-secure-s3-bucket)

Terraform module which creates a S3 bucket on AWS with secure defaults.

## Usage

The simplest usage of this module is shown below. It only requires to pass in the `bucket_name`.

```hcl
module "terraform_state_s3_bucket" {
  source  = "ultratendency/secure-s3-bucket/aws"
  version = "1.0.1"

  bucket_name = "secure-bucket"
}
```

A complete example looks like the following, where all inputs are configured.

```hcl
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
```

<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.9.0 |



## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_kms_key_enable_key_rotation"></a> [aws\_kms\_key\_enable\_key\_rotation](#input\_aws\_kms\_key\_enable\_key\_rotation) | (optional) Indicates whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_aws_kms_key_multi_region"></a> [aws\_kms\_key\_multi\_region](#input\_aws\_kms\_key\_multi\_region) | (optional) Indicates whether the KMS key is a multi-region or regional key | `bool` | `false` | no |
| <a name="input_aws_s3_bucket_public_access_block_block_public_acls"></a> [aws\_s3\_bucket\_public\_access\_block\_block\_public\_acls](#input\_aws\_s3\_bucket\_public\_access\_block\_block\_public\_acls) | (optional) Indicates whether Amazon S3 should block public ACLs for this bucket | `bool` | `true` | no |
| <a name="input_aws_s3_bucket_public_access_block_block_public_policy"></a> [aws\_s3\_bucket\_public\_access\_block\_block\_public\_policy](#input\_aws\_s3\_bucket\_public\_access\_block\_block\_public\_policy) | (optional) Indicates whether Amazon S3 should block public bucket policies for this bucket | `bool` | `true` | no |
| <a name="input_aws_s3_bucket_public_access_block_ignore_public_acls"></a> [aws\_s3\_bucket\_public\_access\_block\_ignore\_public\_acls](#input\_aws\_s3\_bucket\_public\_access\_block\_ignore\_public\_acls) | (optional) Indicates whether Amazon S3 should ignore public ACLS for this bucket | `bool` | `true` | no |
| <a name="input_aws_s3_bucket_public_access_block_restrict_public_buckets"></a> [aws\_s3\_bucket\_public\_access\_block\_restrict\_public\_buckets](#input\_aws\_s3\_bucket\_public\_access\_block\_restrict\_public\_buckets) | (optiona) Indicates whether Amazon S3 should restrict public bucket policies for this bucket | `bool` | `true` | no |
| <a name="input_bucket_lifecycle_configuration_rule_abort_incomplete_multipart_upload_days_after_initiation"></a> [bucket\_lifecycle\_configuration\_rule\_abort\_incomplete\_multipart\_upload\_days\_after\_initiation](#input\_bucket\_lifecycle\_configuration\_rule\_abort\_incomplete\_multipart\_upload\_days\_after\_initiation) | (optional) Number of days after which Amazon S3 aborts an incomplete multipart upload | `number` | `7` | no |
| <a name="input_bucket_lifecycle_configuration_rule_noncurrent_version_expiration_noncurrent_days"></a> [bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_expiration\_noncurrent\_days](#input\_bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_expiration\_noncurrent\_days) | (optional) Number of days an object is noncurrent before Amazon S3 can perform the associated action | `number` | `90` | no |
| <a name="input_bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_noncurrent_days"></a> [bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_first\_transition\_noncurrent\_days](#input\_bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_first\_transition\_noncurrent\_days) | (optional) The number of days noncurrent object versions transition during the first transition | `number` | `30` | no |
| <a name="input_bucket_lifecycle_configuration_rule_noncurrent_version_first_transition_storage_class"></a> [bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_first\_transition\_storage\_class](#input\_bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_first\_transition\_storage\_class) | (optional) The Amazon S3 storage class to which the object should be transitioned during the first transition | `string` | `"STANDARD_IA"` | no |
| <a name="input_bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_noncurrent_days"></a> [bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_second\_transition\_noncurrent\_days](#input\_bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_second\_transition\_noncurrent\_days) | (optional) The number of days noncurrent object versions transition during the second transition | `number` | `60` | no |
| <a name="input_bucket_lifecycle_configuration_rule_noncurrent_version_second_transition_storage_class"></a> [bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_second\_transition\_storage\_class](#input\_bucket\_lifecycle\_configuration\_rule\_noncurrent\_version\_second\_transition\_storage\_class) | (optional) The Amazon S3 storage class to which the object should be transitioned during the second transition | `string` | `"GLACIER"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_kms_alias_arn"></a> [aws\_kms\_alias\_arn](#output\_aws\_kms\_alias\_arn) | The ARN of the KMS key alias |
| <a name="output_aws_kms_alias_target_key_arn"></a> [aws\_kms\_alias\_target\_key\_arn](#output\_aws\_kms\_alias\_target\_key\_arn) | The ARN of the target key ID |
| <a name="output_aws_kms_key_arn"></a> [aws\_kms\_key\_arn](#output\_aws\_kms\_key\_arn) | The ARN of the KMS key |
| <a name="output_aws_kms_key_key_id"></a> [aws\_kms\_key\_key\_id](#output\_aws\_kms\_key\_key\_id) | The key ID of the KMS key |
| <a name="output_aws_s3_bucket_arn"></a> [aws\_s3\_bucket\_arn](#output\_aws\_s3\_bucket\_arn) | The ARN of the S3 bucket |
| <a name="output_aws_s3_bucket_id"></a> [aws\_s3\_bucket\_id](#output\_aws\_s3\_bucket\_id) | The ID of the S3 bucket |
| <a name="output_aws_s3_bucket_lifecycle_configuration_id"></a> [aws\_s3\_bucket\_lifecycle\_configuration\_id](#output\_aws\_s3\_bucket\_lifecycle\_configuration\_id) | The ID of the S3 bucket lifecycle configuration |
| <a name="output_aws_s3_bucket_public_access_block_id"></a> [aws\_s3\_bucket\_public\_access\_block\_id](#output\_aws\_s3\_bucket\_public\_access\_block\_id) | The ID of the S3 bucket public access block |
| <a name="output_aws_s3_bucket_server_side_encryption_configuration_id"></a> [aws\_s3\_bucket\_server\_side\_encryption\_configuration\_id](#output\_aws\_s3\_bucket\_server\_side\_encryption\_configuration\_id) | The ID of the S3 bucket server-side encryption configuration |
| <a name="output_aws_s3_bucket_versioning_id"></a> [aws\_s3\_bucket\_versioning\_id](#output\_aws\_s3\_bucket\_versioning\_id) | The ID of the S3 bucket versioning |

## Examples

An simple example of the default configuration can be found below:

```hcl
provider "aws" {
  region = "eu-central-1"
}

module "terraform_state_s3_bucket" {
  source  = "ultratendency/secure-s3-bucket/aws"
  version = "1.0.1"

  bucket_name = "secure-bucket"
}
```

A more complex example can be found below:

```hcl
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
```

<!-- END_TF_DOCS -->
