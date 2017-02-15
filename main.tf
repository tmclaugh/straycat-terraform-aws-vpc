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

module "vpc_public" {
  source = "./modules/aws_vpc"
  cidr_block = "${var.vpc_public_cidr_block}"
  gateway_enabled = true
  nat_enabled = false
  public_subnets = "${var.vpc_public_public_subnets}"
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  subnet_map_public_ip = true
  vpc_enable_dns_support = true
  vpc_enable_dns_hostnames = true
  vpc_name = "public"
}

module "vpc_private" {
  source = "./modules/aws_vpc"
  cidr_block = "${var.vpc_private_cidr_block}"
  gateway_enabled = true
  nat_enabled = true
  private_subnets = "${var.vpc_private_private_subnets}"
  public_subnets = "${var.vpc_private_public_subnets}"
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  subnet_map_public_ip = false
  vpc_enable_dns_support = true
  vpc_enable_dns_hostnames = true
  vpc_name = "private"
}

module "vpc_peer_public_private" {
  source = "./modules/aws_vpc_peer"

  cidr_block_local        = "${module.vpc_private.vpc_cidr_block}"
  route_table_count_local = "${length(var.aws_availability_zones)}"
  route_table_ids_local   = "${module.vpc_private.route_table_ids_private}"
  vpc_id_local            = "${module.vpc_private.vpc_id}"
  vpc_name_local          = "${module.vpc_private.vpc_name}"

  cidr_block_peer         = "${module.vpc_public.vpc_cidr_block}"
  route_table_count_peer  = "${length(var.aws_availability_zones)}"
  route_table_ids_peer    = "${module.vpc_public.route_table_ids_public}"
  vpc_id_peer             = "${module.vpc_public.vpc_id}"
  vpc_name_peer           = "${module.vpc_public.vpc_name}"
  vpc_owner_id_peer       = "${var.aws_account_id}"
}

