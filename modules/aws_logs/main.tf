/*
* Creates initial S3 buckets for an environment.
* - Logging bucket
*
* TODO:
* - archiving/deleting old logs
*/
resource "aws_s3_bucket" "aws_logging" {
  bucket = "${var.s3_logs_bucket_name}"
  acl    = "log-delivery-write"

  versioning = {
    enabled = false     # Don't need to version logs
  }

  tags = {
    terraform = "true"  # Tag this as Terraform managed
  }
}

