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

# private_subnet is only set because we can't provide optional outputs.
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
  vpc_enable_dns_hostnames = false
  vpc_name = "private"
}

resource "aws_vpc_peering_connection" "private_public" {
  peer_owner_id = "${var.aws_account_id}"
  peer_vpc_id = "${module.vpc_public.vpc_id}"
  vpc_id = "${module.vpc_private.vpc_id}"
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  # must be false because we do not to DNS hostnames in the vpc_private
  requester {
    allow_remote_vpc_dns_resolution = false
  }

  tags {
    Name = "private <-> public"
    terraform = "true"
  }
}

# FIXME: Need better way to get count. Can't set to length of a module's
# output.  Couldn't depend on an output too for some reason.
resource "aws_route" "vpc_peer_private" {
  count                     = "${length(var.aws_availability_zones)}"
  route_table_id            = "${element(module.vpc_private.route_table_ids_private, count.index)}"
  destination_cidr_block    = "${module.vpc_public.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.private_public.id}"
}


resource "aws_route" "vpc_peer_public" {
  count                     = "${length(var.aws_availability_zones)}"
  route_table_id            = "${element(module.vpc_public.route_table_ids_public, count.index)}"
  destination_cidr_block    = "${module.vpc_private.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.private_public.id}"
}

module "bastion" {
  source            = "./modules/bastion"
  instance_key_name = "straycat-tmclaugh-threatstack"
  instance_security_group_id_default = "${module.vpc_public.vpc_default_security_group_id}"

  instance_subnet_id = "${
    lookup(
      module.vpc_public.subnet_id_by_availability_zone_public,
      var.aws_availability_zones[0]
    )
  }"

  instance_vpc_name             = "${module.vpc_public.vpc_name}"
  instance_vpc_id               = "${module.vpc_public.vpc_id}"
  security_group_other_vpc_sgs  = {
    private = "${module.vpc_private.vpc_default_security_group_id}"
  }
}

