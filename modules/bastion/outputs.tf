output "instance_bastion_id" {
  value = "${aws_instance.bastion.id}"
}

output "instance_public_dns" {
  value = "${aws_instance.bastion.public_dns}"
}

output "security_group_bastion" {
  value = "${aws_security_group.bastion.id}"
}

output "security_group_rule_vpc_allow_bastion_ssh_ids" {
  value = ["${aws_security_group_rule.vpc_allow_bastion.*.id}"]
}

