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

output "terraform_state_bucket_arn" {
  value = "${module.aws_s3_terraform_state.bucket_arn}"
}

output "terraform_state_bucket_id" {
  value = "${module.aws_s3_terraform_state.bucket_id}"
}

output "public_vpc_internet_gateway_id" {
  value = "${module.public_vpc.internet_gateway_id}"
}

output "public_vpc_route_table_id" {
  value = "${module.public_vpc.route_table_id}"
}

output "public_vpc_route_default_destination_cidr_block" {
  value = "${module.public_vpc.route_default_destination_cidr_block}"
}

output "public_vpc_route_default_gateway_id" {
  value = "${module.public_vpc.route_default_gateway_id}"
}

output "public_vpc_route_default_route_table_id" {
  value = "${module.public_vpc.route_default_route_table_id}"
}

output "public_vpc_subnet_cidr_blocks" {
  value = ["${module.public_vpc.subnet_cidr_blocks}"]
}

output "public_vpc_subnet_cidr_block_by_availability_zone" {
  value = "${module.public_vpc.subnet_cidr_block_by_availability_zone}"
}

output "public_vpc_subnet_availability_zones" {
  value = ["${module.public_vpc.subnet_availability_zones}"]
}

output "public_vpc_subnet_ids" {
  value = ["${module.public_vpc.subnet_ids}"]
}

output "public_vpc_subnet_id_by_availability_zone" {
  value = "${module.public_vpc.subnet_id_by_availability_zone}"
}

output "public_vpc_vpc_cidr_block" {
  value = "${module.public_vpc.vpc_cidr_block}"
}

output "public_vpc_vpc_id" {
  value = "${module.public_vpc.vpc_id}"
}


