module "aws_vpc" {
  source                    = "./modules/aws_vpc"
  cidr_block                = "${var.vpc_cidr_block}"
  gateway_enabled           = true
  nat_enabled               = false
  private_subnets           = "${var.vpc_private_subnets}"
  private_subnets_allow_all = "${var.private_subnets_allow_all}"
  public_subnets            = "${var.vpc_public_subnets}"
  public_subnets_allow_all  = "${var.public_subnets_allow_all}"
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  vpc_enable_dns_support    = true
  vpc_enable_dns_hostnames  = true
  vpc_name                  = "${var.aws_account}"
}

