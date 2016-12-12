
resource "aws_vpc_peering_connection" "connection" {
  peer_owner_id = "${var.vpc_owner_id_peer}"
  peer_vpc_id   = "${var.vpc_id_peer}"
  vpc_id        = "${var.vpc_id_local}"
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  # must be false because we do not to DNS hostnames in the vpc_private
  requester {
    allow_remote_vpc_dns_resolution = false
  }

  tags {
    Name = "${var.vpc_name_local} <-> ${var.vpc_name_peer}"
    terraform = "true"
  }
}

# FIXME: Need better way to get count. Can't set to length of a module's
# output.  Couldn't depend on an output too for some reason.
resource "aws_route" "vpc_local" {
  count                     = "${var.route_table_count_local}"
  route_table_id            = "${element(var.route_table_ids_local, count.index)}"
  destination_cidr_block    = "${var.cidr_block_peer}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.connection.id}"
}


resource "aws_route" "vpc_peer" {
  count                     = "${var.route_table_count_peer}"
  route_table_id            = "${element(var.route_table_ids_peer, count.index)}"
  destination_cidr_block    = "${var.cidr_block_local}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.connection.id}"
}

