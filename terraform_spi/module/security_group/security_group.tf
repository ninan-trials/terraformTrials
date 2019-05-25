variable "server_name" {}
variable "env" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "allowed_address" { type = "list"}
variable "ports_to_open" { type = "list"}

output "security_group_id" {
  value = "${aws_security_group.security.id}"
}
resource "aws_security_group" "security" {
  name        = "sg_${var.server_name}"
  description = "SG for ${var.server_name}"
  vpc_id      = "${var.vpc_id}"
  tags = {
    "env"= "${var.env}",
    "function" = "${var.server_name}"
    "creator" = "terraform"
  }
}

resource "aws_security_group_rule" "open_ssh_ports" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["${var.allowed_address}"]
  security_group_id = "${aws_security_group.security.id}"
}

resource "aws_security_group_rule" "open_outbound" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.security.id}"
}

resource "aws_security_group_rule" "open_ports" {
  count = "${length(var.ports_to_open)}"
  type            = "ingress"
  from_port       = "${var.ports_to_open[count.index]}"
  to_port         = "${var.ports_to_open[count.index]}"
  protocol        = "tcp"
  cidr_blocks     = ["${var.allowed_address}"]
  security_group_id = "${aws_security_group.security.id}"
}


