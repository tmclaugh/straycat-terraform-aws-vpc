# straycat-terraform-aws-vpc
The Straycat AWS VPC

## Configuration
This service requires the following data to create a VPC.
* ___vpc_cidr_block:___ This is the CIDR block for the VPC network.  This CIDR block is subdivided into multiple subnets.  We currently use the largest CIDR block that a VPC can be.

* ___vpc_private_subnets___: This is the list of CIDR blocks that will be private subnets.  Instances in private subnets do not get publicly routable addresses.  The length of this list must be the same length as ___aws_availablity_zones___.

* ___vpc_public_subnets___: This is the list of CIDR blocks that will be public subnets.  Instances in these subnets will get publicly routable addresses.  The length of this list must be the same length as ___aws_availablity_zones___.

* ___private_subnets_allow_all___: Toggle allow all security group rule for private subnets.

* ___public_subnets_allow_all___: Toggle allow all security group rule for public subnets.
