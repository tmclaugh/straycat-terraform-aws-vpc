output "vpc_peering_connection_id" {
  value = "${aws_vpc_peering_connection.connection.id}"
}

output "vpc_peering_connection_accept_status" {
  value = "${aws_vpc_peering_connection.connection.accept_status}"
}

