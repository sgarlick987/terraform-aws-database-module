resource "aws_security_group" "mysql_allow" {
  name = "allow_all"
  description = "Allow mysql traffic from source security groups"
  vpc_id = "${var.vpc_id}"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${var.source_security_group_ids}"]
  }
}