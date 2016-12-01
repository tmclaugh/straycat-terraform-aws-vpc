variable "vpc_name" {}
variable "cidr_block" {}
variable "vpc_enable_dns_hostnames" {}
variable "vpc_enable_dns_support" {}
variable "gateway_enabled" {}
variable "security_group_default_ingress" {
  default = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    self = true
  }
}
variable "security_group_default_egress" {
  default = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
}
variable "subnets" { default = [] }
variable "subnet_availability_zones" { default = [] }
variable "subnet_map_public_ip" {}
