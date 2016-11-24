/*
* Define our global vars and any other setup elements.
*
* TODO: Handle multi-region in some manner
*/
variable "aws_profile" {}

variable "aws_account" {}

variable "environment" {}

variable "domain" {}

variable "aws_region" {
  default = "us-east-1"
}

variable "availability_zones" {
  default = ["us-east-1c", "us-east-1d", "us-east-1e"]
}

provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}
