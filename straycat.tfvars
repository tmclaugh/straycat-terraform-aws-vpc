/*
* aws vars for Terraform
*/
aws_profile = "straycat"                # AWS credentials profile name
aws_account = "straycat"                # AWS account name
aws_account_id = ""                     # AWS account ID
domain = "straycat.dhs.org"             # domain name; we prefix S3 buckets with this
environment = "master"                  # Name of our environment

# VPC
vpc_cidr_block      = "10.1.0.0/16"
vpc_private_subnets = ["10.1.0.0/20", "10.1.16.0/20", "10.1.32.0/20"]
vpc_public_subnets  = ["10.1.255.0/26", "10.1.255.64/26", "10.1.255.128/26"]

