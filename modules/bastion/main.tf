/*
* Create a bastion host.
*/
resource "aws_security_group" "bastion" {
  name        = "${var.instance_vpc_name}-bastion"
  description = "bastion hosts"
  vpc_id      = "${var.instance_vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.instance_vpc_name}-bastion"
    terraform = "true"
  }
}

# NOTE: In general I'd prefer to not do this but in this case I think it makes
# the most sense to alter an existing SG.
resource "aws_security_group_rule" "vpc_allow_bastion" {
  count                     = "${length(var.security_group_other_vpc_sgs)}"
  type                      = "ingress"
  from_port                 = 22
  to_port                   = 22
  protocol                  = "tcp"
  source_security_group_id  = "${aws_security_group.bastion.id}"
  security_group_id         = "${element(values(var.security_group_other_vpc_sgs), count.index)}"

}

resource "aws_instance" "bastion" {
  ami                     = "${var.instance_ami_id}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.instance_key_name}"
  subnet_id               = "${var.instance_subnet_id}"
  vpc_security_group_ids  = [
    "${var.instance_security_group_id_default}",
    "${aws_security_group.bastion.id}"
  ]

  tags {
    Name = "bastion"
    terraform = true
  }
}

