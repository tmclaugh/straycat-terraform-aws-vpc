output "s3_logs_bucket_id" {
  value = "${aws_s3_bucket.aws_logging.id}"
}

output "s3_logs_bucket_arn" {
  value = "${aws_s3_bucket.aws_logging.arn}"
}

output "s3_terraform_bucket_id" {
  value = "${aws_s3_bucket.terraform_state.id}"
}

output "s3_terraform_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}

