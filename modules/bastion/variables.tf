variable "instance_ami_id" {
  type = "string"
  description = "AMI ID for bastion host."
  default = "ami-b73b63a0"
}

variable "instance_key_name" {
  type = "string"
  description = "SSH key for instance"
}

variable "instance_subnet_id" {
  type = "string"
  description = "Subnet ID to place instance."
}

variable "instance_type" {
  type = "string"
  description = "Instance type for bastion host."
  default = "t2.micro"
}

variable "instance_security_group_id_default" {
  type = "string"
  description = "ID for default SG of the VPC the instance will live in."
}

variable "instance_vpc_name" {
  type = "string"
  description = "Name of VPC bastion will live in."
}

variable "instance_vpc_id" {
  type = "string"
  description = "ID of VPC bastion will live in."
}

# FIXME: Using a list tripped over a bug when trying to get the length of an
# array populated by output values. Converted to a map because that works for
# some reason...
variable "security_group_other_vpc_sgs" {
  type = "map"
  description = "A list of SGs to allow bastion traffic from."
  default = {}
}

