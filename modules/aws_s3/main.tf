/*
* Creates initial S3 buckets for an environment.
* - terraform states bucket
*
* TODO:
* - archiving/deleting old states
*/

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  versioning = {
    enabled = "${var.versioning}"
  }

  logging = {
    target_bucket = "${var.s3_logs_bucket}"
    target_prefix = "s3/${var.s3_bucket_name}/"
  }

  tags = {
    terraform = "true"
  }
}

