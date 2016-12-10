/*
* Define our global vars and any other setup elements.
*
* TODO: Handle multi-region in some manner
*/
variable "aws_profile" {}

variable "aws_account" {}

variable "aws_account_id" {}

variable "environment" {}

variable "domain" {}

variable "aws_region" {
  default = "us-east-1"
}

# FIXME: replace hard coding with an aws provider var if I can figure out how
# to limit the list size.
variable "aws_availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

