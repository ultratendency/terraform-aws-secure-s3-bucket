# Simple bucket

The configuration in this directory creates a S3 bucket with all default values.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which can cost money (AWS Elastic IP, for example).
Run `terraform destroy`` when you don't need these resources.
