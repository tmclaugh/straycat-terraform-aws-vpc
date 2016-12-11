resource "aws_vpc" "vpc" {
  cidr_block            = "${var.cidr_block}"
  enable_dns_hostnames  = "${var.vpc_enable_dns_hostnames}"
  enable_dns_support    = "${var.vpc_enable_dns_support}"

  tags = {
    Name      = "${var.vpc_name}"
    terraform = "true"
  }
}

# This is what we consider our default SG, not the SG created by the VPC
# called "default".
resource "aws_security_group" "default" {
  name        = "${var.vpc_name}-default"
  description = "Standard default SG for VPC ${var.vpc_name}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name      = "${var.vpc_name}-default"
    terraform = "true"
  }
}

resource "aws_security_group_rule" "default_ssh_ingress" {
  type                      = "ingress"
  from_port                 = "${var.security_group_default_ingress["from_port"]}"
  to_port                   = "${var.security_group_default_ingress["to_port"]}"
  protocol                  = "${var.security_group_default_ingress["protocol"]}"
  source_security_group_id  = "${aws_security_group.default.id}"
  security_group_id         = "${aws_security_group.default.id}"

}

resource "aws_security_group_rule" "default_ssh_egress" {
  type                      = "egress"
  from_port                 = "${var.security_group_default_egress["from_port"]}"
  to_port                   = "${var.security_group_default_egress["to_port"]}"
  protocol                  = "${var.security_group_default_egress["protocol"]}"
  cidr_blocks               = ["${var.security_group_default_egress["cidr_blocks"]}"]
  security_group_id         = "${aws_security_group.default.id}"

}

# NOTE: We're limited to a small number of IGWs per region. Unlike other
# resources we do a single IGW per VPC for this reason.
resource "aws_internet_gateway" "internet_gateway" {
  count = "${var.gateway_enabled}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}"
    terraform = "true"
  }
}

resource "aws_subnet" "private" {
  count                   = "${length(var.private_subnets)}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnets[count.index]}"
  availability_zone       = "${var.subnet_availability_zones[count.index]}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-${var.subnet_availability_zones[count.index]}-private"
    terraform = "true"
  }
}

resource "aws_subnet" "public" {
  count                   = "${length(var.public_subnets)}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${var.subnet_availability_zones[count.index]}"
  map_public_ip_on_launch = "${var.subnet_map_public_ip}"

  tags = {
    Name = "${var.vpc_name}-${var.subnet_availability_zones[count.index]}-public"
    terraform = "true"
  }
}

resource "aws_eip" "nat" {
  count         = "${length(var.public_subnets) * var.nat_enabled}"
  vpc           = true
}


resource "aws_nat_gateway" "nat_gateway" {
  count         = "${length(var.public_subnets) * var.nat_enabled}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
}


resource "aws_route_table" "public" {
  count   = "${length(var.public_subnets)}"
  vpc_id  = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}-${element(var.subnet_availability_zones, count.index)}-public"
    terraform = "true"
  }
}

resource "aws_route_table" "private" {
  count   = "${length(var.private_subnets)}"
  vpc_id  = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}-${element(var.subnet_availability_zones, count.index)}-private"
    terraform = "true"
  }
}

resource "aws_route" "public_igw" {
  count                   = "${length(var.public_subnets) * var.gateway_enabled}"
  route_table_id          = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.internet_gateway.id}"
  depends_on              = ["aws_route_table.public"]
}

resource "aws_route" "private_nat" {
  count                   = "${length(var.private_subnets) * var.nat_enabled}"
  route_table_id          = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id          = "${element(aws_nat_gateway.nat_gateway.*.id, count.index)}"
  depends_on              = ["aws_route_table.private"]
}

resource "aws_route_table_association" "public" {
  count           = "${length(var.public_subnets)}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id  = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route_table_association" "private" {
  count           = "${length(var.private_subnets)}"
  subnet_id       = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
}

