resource "aws_vpc" "vpc" {
  cidr_block            = "${var.cidr_block}"
  enable_dns_hostnames  = "${var.vpc_enable_dns_hostnames}"
  enable_dns_support    = "${var.vpc_enable_dns_support}"

  tags = {
    Name      = "${var.vpc_name}"
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

resource "aws_route_table" "route_table" {
  vpc_id  = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.vpc_name}"
    terraform = "true"
  }
}

resource "aws_route" "default" {
  route_table_id          = "${aws_route_table.route_table.id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.internet_gateway.id}"
  depends_on              = ["aws_route_table.route_table"]
}

resource "aws_route_table_association" "route_table_association" {
  count           = "${length(var.subnet_availability_zones)}"
  subnet_id       = "${element(aws_subnet.subnet.*.id, count.index)}"
  route_table_id  = "${aws_route_table.route_table.id}"
}

