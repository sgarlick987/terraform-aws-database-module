resource "aws_security_group" "mysql_allow" {
  name = "${var.application}-${var.environment}-${var.detail}-db"
  description = "Allow mysql traffic from source security groups"
  vpc_id = "${var.vpc_id}"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${var.source_security_group_ids}"]
  }
}

resource "aws_security_group_rule" "source_security_group_egress" {
  count = "${length(var.source_security_group_ids)}"
  from_port = 3306
  to_port = 3306
  source_security_group_id = "${aws_security_group.mysql_allow.id}"
  security_group_id = "${var.source_security_group_ids[count.index]}"
  protocol = "tcp"
  type = "egress"
}