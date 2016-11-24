/*
* Creates initial S3 buckets for an environment.
* - Logging bucket
* - terraform states bucket
*
* TODO:
* - archiving/deleting old logs
* - archiving/deleting old states
*/
resource "aws_s3_bucket" "aws_logging" {
  bucket = "${var.domain}-${var.environment}-logs"
  acl    = "log-delivery-write"

  versioning = {
    enabled = false     # Don't need to version logs
  }

  tags = {
    terraform = "true"  # Tag this as Terraform managed
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.domain}-${var.environment}-terraform"
  acl    = "private"

  versioning = {
    enabled = "true"    # We want this versioned so we can look back in time.
  }

  logging = {
    target_bucket = "${aws_s3_bucket.aws_logging.id}"
    target_prefix = "s3/${var.domain}-${var.environment}-terraform/"
  }

  tags = {
    terraform = "true"
  }
}
