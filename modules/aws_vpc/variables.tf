variable "vpc_name" {}
variable "cidr_block" {}
variable "vpc_enable_dns_hostnames" {}
variable "vpc_enable_dns_support" {}
variable "gateway_enabled" {}
variable "subnets" { default = [] }
variable "subnet_availability_zones" { default = [] }
variable "subnet_map_public_ip" {}
