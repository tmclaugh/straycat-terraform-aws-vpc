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

  ingress {
    from_port = "${var.security_group_default_ingress["from_port"]}"
    to_port = "${var.security_group_default_ingress["to_port"]}"
    protocol = "${var.security_group_default_ingress["protocol"]}"
    self = "${var.security_group_default_ingress["self"]}"
  }
  egress {
    from_port = "${var.security_group_default_egress["from_port"]}"
    to_port = "${var.security_group_default_egress["to_port"]}"
    protocol = "${var.security_group_default_egress["protocol"]}"
    cidr_blocks = ["${var.security_group_default_egress["cidr_blocks"]}"]
  }

  tags = {
    Name      = "${var.vpc_name}-default"
    terraform = "true"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  count = "${var.gateway_enabled}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}"
    terraform = "true"
  }
}

resource "aws_internet_gateway" "internet_gateway_nat" {
  count = "${var.nat_enabled}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}-nat"
    terraform = "true"
  }
}

resource "aws_subnet" "subnet" {
  count                   = "${length(var.subnet_availability_zones)}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnets[count.index]}"
  availability_zone       = "${var.subnet_availability_zones[count.index]}"
  map_public_ip_on_launch = "${var.subnet_map_public_ip}"

  tags = {
    Name = "${var.vpc_name}-${var.subnet_availability_zones[count.index]}"
    terraform = "true"
  }
}

resource "aws_subnet" "subnet_nat_public" {
  count                   = "${length(var.subnet_availability_zones) * var.nat_enabled}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.nat_public_subnets[count.index]}"
  availability_zone       = "${var.subnet_availability_zones[count.index]}"
  map_public_ip_on_launch = false

  tags = {
    Name =
    "${var.vpc_name}-${var.subnet_availability_zones[count.index]}-nat_public"
    terraform = "true"
  }
}

resource "aws_eip" "eip_nat" {
  count         = "${length(var.subnet_availability_zones) * var.nat_enabled}"
  vpc           = true
}


resource "aws_nat_gateway" "nat_gateway" {
  count         = "${length(var.subnet_availability_zones) * var.nat_enabled}"
  allocation_id = "${element(aws_eip.eip_nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.subnet_nat_public.*.id, count.index)}"
}


resource "aws_route_table" "route_table" {
  count   = "${length(var.subnet_availability_zones)}"
  vpc_id  = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}-${element(var.subnet_availability_zones,
    count.index)}"
    terraform = "true"
  }
}

resource "aws_route" "default_igw" {
  count                   = "${length(var.subnet_availability_zones) * var.gateway_enabled}"
  route_table_id          = "${element(aws_route_table.route_table.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.internet_gateway.id}"
  depends_on              = ["aws_route_table.route_table"]
}

resource "aws_route" "default_nat" {
  count                   = "${length(var.subnet_availability_zones) * var.nat_enabled}"
  route_table_id          = "${element(aws_route_table.route_table.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.internet_gateway_nat.id}"
  depends_on              = ["aws_route_table.route_table"]
}

resource "aws_route_table_association" "route_table_association_igw" {
  count           = "${length(var.subnet_availability_zones) * var.gateway_enabled}"
  subnet_id       = "${element(aws_subnet.subnet.*.id, count.index)}"
  route_table_id  = "${element(aws_route_table.route_table.*.id, count.index)}"
}

resource "aws_route_table_association" "route_table_association_nat" {
  count           = "${length(var.subnet_availability_zones) * var.nat_enabled}"
  subnet_id       = "${element(aws_subnet.subnet.*.id, count.index)}"
  route_table_id  = "${element(aws_route_table.route_table.*.id, count.index)}"
}

