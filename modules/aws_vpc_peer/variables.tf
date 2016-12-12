variable "cidr_block_local" {
  type = "string"
  description = "CIDR block of local VPC"
}

variable "cidr_block_peer" {
  type = "string"
  description = "CIDR block of peer VPC"
}

# FIXME: This exists because we can't properly calculate the length of an
# output due to Terraform limitation.
variable "route_table_count_local" {
  type = "string"
  description = "Number of routes to create."
}

variable "route_table_ids_local" {
  type = "list"
  description = "List of local route tables."
}

# FIXME: This exists because we can't properly calculate the length of an
# output due to Terraform limitation.
variable "route_table_count_peer" {
  type = "string"
  description = "Number of routes to create."
}

variable "route_table_ids_peer" {
  type = "list"
  description = "List of peer route tables."
}

variable "vpc_id_local" {
  type = "string"
  description = "ID of the local VPC."
}

variable "vpc_name_local" {
  type = "string"
  description = "Name of the local VPC."
}

variable "vpc_id_peer" {
  type = "string"
  description = "ID of VPC to peer with."
}

variable "vpc_owner_id_peer" {
  type = "string"
  description = "Owner ID of the VPC that will be peered."
}

variable "vpc_name_peer" {
  type = "string"
  description = "Name of peer VPC."
}
