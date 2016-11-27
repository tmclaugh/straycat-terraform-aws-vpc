output "domain" {
  value = "${var.domain}"
}

output "environment" {
  value = "${var.environment}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "aws_availability_zones" {
  value = ["${var.aws_availability_zones}"]
}

output "aws_s3_logs_bucket_id" {
  value = "${module.aws_logs.bucket_id}"
}

output "aws_s3_logs_bucket_arn" {
  value = "${module.aws_logs.bucket_arn}"
}
