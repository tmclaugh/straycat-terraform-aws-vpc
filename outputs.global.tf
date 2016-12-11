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

output "aws_logs.bucket_id" {
  value = "${module.aws_logs.bucket_id}"
}

output "aws_logs.bucket_arn" {
  value = "${module.aws_logs.bucket_arn}"
}

output "aws_s3_terraform_state.bucket_arn" {
  value = "${module.aws_s3_terraform_state.bucket_arn}"
}

output "aws_s3_terraform_state.bucket_id" {
  value = "${module.aws_s3_terraform_state.bucket_id}"
}


output "vpc_public.route_table_ids_private" {
  value = "${module.vpc_public.route_table_ids_private}"
}

output "vpc_public.route_table_ids_public" {
  value = "${module.vpc_public.route_table_ids_public}"
}


output "vpc_private.route_table_id_private" {
  value = "${module.vpc_private.route_table_ids_private}"
}

output "vpc_private.route_table_id_public" {
  value = "${module.vpc_private.route_table_ids_public}"
}


# vpc_private
output "vpc_private.vpc_id" {
  value = "${module.vpc_private.vpc_id}"
}

output "vpc_private.vpc_name" {
  value = "${module.vpc_private.vpc_name}"
}

output "vpc_private.vpc_cidr_block" {
  value = "${module.vpc_private.vpc_cidr_block}"
}

output "vpc_private.default_security_group_id" {
  value = "${module.vpc_private.vpc_default_security_group_id}"
}

output "vpc_private.subnet_availability_zones_private" {
  value ="${module.vpc_private.subnet_availability_zones_private}"
}

output "vpc_private.subnet_cidr_blocks_private" {
  value = ["${module.vpc_private.subnet_cidr_blocks_private}"]
}

output "vpc_private.subnet_ids_private" {
  value = ["${module.vpc_private.subnet_ids_private}"]
}

output "vpc_private.subnet_id_by_availability_zone_private" {
  value = "${module.vpc_private.subnet_id_by_availability_zone_private}"
}

output "vpc_private.subnet_cidr_block_by_availability_zone_private" {
  value = "${module.vpc_private.subnet_cidr_block_by_availability_zone_private}"
}

output "vpc_private.subnet_availability_zones_public" {
  value ="${module.vpc_private.subnet_availability_zones_public}"
}

output "vpc_private.subnet_cidr_blocks_public" {
  value = ["${module.vpc_private.subnet_cidr_blocks_public}"]
}

output "vpc_private.subnet_ids_public" {
  value = ["${module.vpc_private.subnet_ids_public}"]
}

output "vpc_private.subnet_id_by_availability_zone_public" {
  value = "${module.vpc_private.subnet_id_by_availability_zone_public}"
}

output "vpc_private.subnet_cidr_block_by_availability_zone_public" {
  value = "${module.vpc_private.subnet_cidr_block_by_availability_zone_public}"
}


# vpc_public
output "vpc_public.vpc_id" {
  value = "${module.vpc_public.vpc_id}"
}

output "vpc_public.vpc_name" {
  value = "${module.vpc_public.vpc_name}"
}

output "vpc_public.vpc_cidr_block" {
  value = "${module.vpc_public.vpc_cidr_block}"
}

output "vpc_public.default_security_group_id" {
  value = "${module.vpc_public.vpc_default_security_group_id}"
}

output "vpc_public.subnet_availability_zones_private" {
  value ="${module.vpc_public.subnet_availability_zones_private}"
}

output "vpc_public.subnet_cidr_blocks_private" {
  value = ["${module.vpc_public.subnet_cidr_blocks_private}"]
}

output "vpc_public.subnet_ids_private" {
  value = ["${module.vpc_public.subnet_ids_private}"]
}

output "vpc_public.subnet_id_by_availability_zone_private" {
  value = "${module.vpc_public.subnet_id_by_availability_zone_private}"
}

output "vpc_public.subnet_cidr_block_by_availability_zone_private" {
  value = "${module.vpc_public.subnet_cidr_block_by_availability_zone_private}"
}

output "vpc_public.subnet_availability_zones_public" {
  value ="${module.vpc_public.subnet_availability_zones_public}"
}

output "vpc_public.subnet_cidr_blocks_public" {
  value = ["${module.vpc_public.subnet_cidr_blocks_public}"]
}

output "vpc_public.subnet_ids_public" {
  value = ["${module.vpc_public.subnet_ids_public}"]
}

output "vpc_public.subnet_id_by_availability_zone_public" {
  value = "${module.vpc_public.subnet_id_by_availability_zone_public}"
}

output "vpc_public.subnet_cidr_block_by_availability_zone_public" {
  value = "${module.vpc_public.subnet_cidr_block_by_availability_zone_public}"
}


# bastion host
output "bastion.instance_bastion_id" {
  value = "${module.bastion.instance_bastion_id}"
}

output "bastion.instance_public_dns" {
  value = "${module.bastion.instance_public_dns}"
}

output "bastion.security_group_bastion_id" {
  value = "${module.bastion.security_group_bastion_id}"
}

output "bastion.security_group_rule_vpc_allow_bastion_ssh_ids" {
  value = "${module.bastion.security_group_rule_vpc_allow_bastion_ssh_ids}"
}

