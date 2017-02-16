output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

# retrun the SG ID that we consider our default, not the default SG created
# along with the VPC.
output "vpc_default_security_group_id" {
  value ="${aws_security_group.default.id}"
}

output "vpc_default_security_group_id_private" {
  value ="${aws_security_group.default_private.id}"
}

output "vpc_default_security_group_id_public" {
  value ="${aws_security_group.default_public.id}"
}

output "route_table_ids_private" {
  value = ["${aws_route_table.private.*.id}"]
}

output "subnet_availability_zones_private" {
  value = ["${aws_subnet.private.*.availability_zone}"]
}

output "subnet_cidr_blocks_private" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

output "subnet_ids_private" {
  value = ["${aws_subnet.private.*.id}"]
}

output "subnet_id_by_availability_zone_private" {
  value = "${
    zipmap(
      aws_subnet.private.*.availability_zone,
      aws_subnet.private.*.id
    )
  }"
}

output "subnet_cidr_block_by_availability_zone_private" {
  value = "${
    zipmap(
      aws_subnet.private.*.availability_zone,
      aws_subnet.private.*.cidr_block
    )
  }"
}

output "route_table_ids_public" {
  value = ["${aws_route_table.public.*.id}"]
}

output "subnet_availability_zones_public" {
  value = ["${aws_subnet.public.*.availability_zone}"]
}

output "subnet_cidr_blocks_public" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}
output "subnet_ids_public" {
  value = ["${aws_subnet.public.*.id}"]
}

output "subnet_id_by_availability_zone_public" {
  value = "${
    zipmap(
      aws_subnet.public.*.availability_zone,
      aws_subnet.public.*.id
    )
  }"
}

output "subnet_cidr_block_by_availability_zone_public" {
  value = "${
    zipmap(
      aws_subnet.public.*.availability_zone,
      aws_subnet.public.*.cidr_block
    )
  }"
}

