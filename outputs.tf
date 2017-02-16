# VPCs
output "vpc.vpc_id" {
  value = "${module.aws_vpc.vpc_id}",
}

output "vpc.vpc_name" {
  value = "${module.aws_vpc.vpc_name}",
}

output "vpc.vpc_cidr_block" {
  value = "${module.aws_vpc.vpc_cidr_block}"
}

output "vpc.default_security_group_id" {
  value = "${module.aws_vpc.vpc_default_security_group_id}"
}

output "vpc.default_security_group_id_private" {
  value = "${module.aws_vpc.vpc_default_security_group_id_private}"
}

output "vpc.default_security_group_id_public" {
  value = "${module.aws_vpc.vpc_default_security_group_id_public}"
}

output "vpc.default_security_group_ids" {
  value = {
    all ="${module.aws_vpc.vpc_default_security_group_id}"
    private ="${module.aws_vpc.vpc_default_security_group_id_private}"
    public ="${module.aws_vpc.vpc_default_security_group_id_public}"
  }
}

output "vpc.route_table_ids" {
  value = {
    private = "${module.aws_vpc.route_table_ids_private}"
    public = "${module.aws_vpc.route_table_ids_public}"
  }
}

output "vpc.subnet_availability_zones" {
  value = {
    private = "${module.aws_vpc.subnet_availability_zones_private}"
    public = "${module.aws_vpc.subnet_availability_zones_public}"
  }
}

output "vpc.subnet_cidr_blocks" {
  value = {
    private = "${module.aws_vpc.subnet_cidr_blocks_private}"
    public = "${module.aws_vpc.subnet_cidr_blocks_public}"
  }
}

output "vpc.subnet_ids" {
  value = {
    private = "${module.aws_vpc.subnet_ids_private}"
    public = "${module.aws_vpc.subnet_ids_public}"
  }
}

output "vpc.subnet_id_by_availability_zone" {
  value = {
    private = "${module.aws_vpc.subnet_id_by_availability_zone_private}"
    public = "${module.aws_vpc.subnet_id_by_availability_zone_public}"
  }
}

output "vpc.subnet_cidr_block_by_availability_zone" {
  value = {
    private = "${module.aws_vpc.subnet_cidr_block_by_availability_zone_private}"
    public = "${module.aws_vpc.subnet_cidr_block_by_availability_zone_public}"
  }
}

output "vpc.subnet_availability_zones_private" {
  value = "${module.aws_vpc.subnet_availability_zones_private}"
}

output "vpc.subnet_cidr_blocks_private" {
  value = "${module.aws_vpc.subnet_cidr_blocks_private}"
}

output "vpc.subnet_ids_private" {
  value = "${module.aws_vpc.subnet_ids_private}"
}

output "vpc.subnet_id_by_availability_zone_private" {
  value = "${module.aws_vpc.subnet_id_by_availability_zone_private}"
}

output "vpc.subnet_cidr_block_by_availability_zone_private" {
  value = "${module.aws_vpc.subnet_cidr_block_by_availability_zone_private}"
}

output "vpc.route_table_ids_public" {
  value = "${module.aws_vpc.route_table_ids_public}"
}

output "vpc.subnet_availability_zones_public" {
  value = "${module.aws_vpc.subnet_availability_zones_public}"
}

output "vpc.subnet_cidr_blocks_public" {
  value = "${module.aws_vpc.subnet_cidr_blocks_public}"
}

output "vpc.subnet_id_by_availability_zone_public" {
  value = "${module.aws_vpc.subnet_id_by_availability_zone_public}"
}

output "vpc.subnet_cidr_block_by_availability_zone_public" {
  value = "${module.aws_vpc.subnet_cidr_block_by_availability_zone_public}"
}

