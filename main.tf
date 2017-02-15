module "aws_vpc" {
  source                    = "./modules/aws_vpc"
  cidr_block                = "${var.vpc_cidr_block}"
  gateway_enabled           = true
  nat_enabled               = false
  private_subnets           = "${var.vpc_private_subnets}"
  public_subnets            = "${var.vpc_public_subnets}"
  subnet_availability_zones = ["${var.aws_availability_zones}"]
  vpc_enable_dns_support    = true
  vpc_enable_dns_hostnames  = true
  vpc_name                  = "${var.aws_account}-${var.environment}"
}

