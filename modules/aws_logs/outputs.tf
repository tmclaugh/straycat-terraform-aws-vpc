output "bucket_id" {
  value = "${aws_s3_bucket.aws_logging.id}"
}

output "bucket_arn" {
  value = "${aws_s3_bucket.aws_logging.arn}"
}

