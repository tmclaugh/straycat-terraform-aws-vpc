/* FIXME: This resource is optional
output "internet_gateway_id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}
*/

output "route_table_id" {
  value = "${aws_route_table.route_table.id}"
}

/* FIXME: These resources are optional
output "route_default_igw_destination_cidr_block" {
  value = "${aws_route.default_igw.destination_cidr_block}"
}

output "route_default_igw_gateway_id" {
  value = "${aws_route.default_igw.gateway_id}"
}

output "route_default_igw_route_table_id" {
  value = "${aws_route.default_igw.route_table_id}"
}
*/

output "subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet.*.cidr_block}"]
}

output "subnet_availability_zones" {
  value = ["${aws_subnet.subnet.*.availability_zone}"]
}

output "subnet_cidr_block_by_availability_zone" {
  value = "${zipmap(aws_subnet.subnet.*.availability_zone, aws_subnet.subnet.*.cidr_block)}"
}

output "subnet_ids" {
  value = ["${aws_subnet.subnet.*.id}"]
}

output "subnet_id_by_availability_zone" {
  value = "${zipmap(aws_subnet.subnet.*.availability_zone, aws_subnet.subnet.*.id)}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

# retrun the SG ID that we consider our default, not the default SG created
# along with the VPC.
output "vpc_default_security_group_id" {
  value ="${aws_security_group.default.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

