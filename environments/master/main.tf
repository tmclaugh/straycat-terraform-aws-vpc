module "aws_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.domain}-${var.environment}-logs"
}

module "aws_s3_terraform_state" {
  source         = "./modules/aws_s3"
  s3_bucket_name = "${var.domain}-${var.environment}-terraform"
  s3_logs_bucket = "${module.aws_logs.bucket_id}"
  versioning     = "true"
}

/*
module "private_vpc" {
  source = "./modules/aws_vpc"
  cidr_block = "10.1.0.0/16"
  gateway_enabled = false
  nat_enabled = true
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  subnets = ["10.1.0.0/20", "10.1.16.0/20", "10.1.32.0/20"]
  vpc_enable_dns_support = false
  vpc_enable_dns_hostnames = false
  vpc_name = "private"
}
*/

module "public_vpc" {
  source = "./modules/aws_vpc"
  cidr_block = "172.16.0.0/16"
  gateway_enabled = true
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  subnets = ["172.16.0.0/20", "172.16.16.0/20", "172.16.32.0/20"]
  subnet_map_public_ip = true
  vpc_enable_dns_support = true
  vpc_enable_dns_hostnames = true
  vpc_name = "public"
}

