provider "aws" {
  region = "eu-central-1"
}

module "terraform_state_s3_bucket" {
  source  = "ultratendency/secure-s3-bucket/aws"
  version = "1.0.1"

  bucket_name = "secure-bucket"
}
