/*
* aws vars for Terraform
*/
aws_profile = "straycat"                # AWS credentials profile name
aws_account = "straycat"                # AWS account name
aws_account_id = ""                     # AWS account ID
domain = "straycat.dhs.org"             # domain name; we prefix S3 buckets with this
environment = "master"                  # Name of our environment

# VPC
vpc_public_cidr_block       = "172.16.0.0/16"
vpc_public_public_subnets   = ["172.16.0.0/20", "172.16.16.0/20", "172.16.32.0/20"]

vpc_private_cidr_block      = "10.1.0.0/16"
vpc_private_private_subnets = ["10.1.0.0/20", "10.1.16.0/20", "10.1.32.0/20"]
vpc_private_public_subnets  = ["10.1.255.208/28", "10.1.255.224/28", "10.1.255.240/28"]

