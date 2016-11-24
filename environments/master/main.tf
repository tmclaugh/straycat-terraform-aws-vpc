module "aws_init" {
  source                   = "./modules/aws_init"
  s3_logs_bucket_name      = "${var.domain}-${var.environment}-logs"
  s3_terraform_bucket_name = "${var.domain}-${var.environment}-terraform"
  s3_terraform_logs_path   = "s3/${var.domain}-${var.environment}-terraform/"
}
