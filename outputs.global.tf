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


# VPCs
output "vpc.vpc_id" {
  value = {
    private = "${module.vpc_private.vpc_id}",
    public  = "${module.vpc_public.vpc_id}"
  }
}

output "vpc.vpc_names" {
  value = [
    "${module.vpc_private.vpc_name}",
    "${module.vpc_public.vpc_name}"
  ]
}

output "vpc.vpc_cidr_block" {
  value = {
    private = "${module.vpc_private.vpc_cidr_block}"
    public  = "${module.vpc_public.vpc_cidr_block}"
  }
}

output "vpc.default_security_group_id" {
  value = {
    private = "${module.vpc_private.vpc_default_security_group_id}"
    public  = "${module.vpc_public.vpc_default_security_group_id}"
  }
}

output "vpc.route_table_ids_private" {
  value = {
    private = "${module.vpc_private.route_table_ids_private}"
    public  = "${module.vpc_public.route_table_ids_private}"
  }
}

output "vpc.route_table_ids_public" {
  value = {
    private = "${module.vpc_private.route_table_ids_public}"
    public  = "${module.vpc_public.route_table_ids_public}"
  }
}

output "vpc.subnet_availability_zones_private" {
  value = {
    private = "${module.vpc_private.subnet_availability_zones_private}"
    public  = "${module.vpc_public.subnet_availability_zones_private}"
  }
}

output "vpc.subnet_cidr_blocks_private" {
  value = {
    private = "${module.vpc_private.subnet_cidr_blocks_private}"
    public  = "${module.vpc_public.subnet_cidr_blocks_private}"
  }
}

output "vpc.subnet_ids_private" {
  value = {
    private = "${module.vpc_private.subnet_ids_private}"
    public  = "${module.vpc_public.subnet_ids_private}"
  }
}

output "vpc.subnet_id_by_availability_zone_private" {
  value = {
    private = "${module.vpc_private.subnet_id_by_availability_zone_private}"
    public  = "${module.vpc_public.subnet_id_by_availability_zone_private}"
  }
}

output "vpc.subnet_cidr_block_by_availability_zone_private" {
  value = {
    private = "${module.vpc_private.subnet_cidr_block_by_availability_zone_private}"
    public  = "${module.vpc_public.subnet_cidr_block_by_availability_zone_private}"
  }
}

output "vpc.subnet_availability_zones_public" {
  value = {
    private = "${module.vpc_private.subnet_availability_zones_public}"
    public  = "${module.vpc_public.subnet_availability_zones_public}"
  }
}

output "vpc.subnet_cidr_blocks_public" {
  value = {
    private = "${module.vpc_private.subnet_cidr_blocks_public}"
    public  = "${module.vpc_public.subnet_cidr_blocks_public}"
  }
}

output "vpc.subnet_ids_public" {
  value = {
    private = "${module.vpc_private.subnet_ids_public}"
    public  = "${module.vpc_public.subnet_ids_public}"
  }
}

output "vpc.subnet_id_by_availability_zone_public" {
  value = {
    private = "${module.vpc_private.subnet_id_by_availability_zone_public}"
    public  = "${module.vpc_public.subnet_id_by_availability_zone_public}"
  }
}

output "vpc.subnet_cidr_block_by_availability_zone_public" {
  value = {
    private = "${module.vpc_private.subnet_cidr_block_by_availability_zone_public}"
    public  = "${module.vpc_public.subnet_cidr_block_by_availability_zone_public}"
  }
}

# VPC peering
output "vpc_peer_public_private.vpc_peering_connection_id" {
  value = "${module.vpc_peer_public_private.vpc_peering_connection_id}"
}

output "vpc_peer_public_private.vpc_peering_connection_accept_status" {
  value = "${module.vpc_peer_public_private.vpc_peering_connection_accept_status}"
}

