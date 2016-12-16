resource "aws_db_instance" "mysql" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type = "gp2"
  engine               = "mysql"
  engine_version       = "${var.db_engine_version}"
  instance_class       = "${var.db_instance_type}"
  name                 = "${var.application}"
  identifier           = "${var.application}-${var.environment}-${var.detail}"
  final_snapshot_identifier = "${var.application}-${var.environment}-${var.detail}"
  username             = "${var.master_username}"
  password             = "${var.master_password}"
  db_subnet_group_name = "${var.db_subnet_group}"
  parameter_group_name = "${aws_db_parameter_group.mysql.name}"
  auto_minor_version_upgrade = true
  allow_major_version_upgrade = true
  copy_tags_to_snapshot = true
  backup_retention_period = 1
  multi_az = "${var.multi_az}"
  vpc_security_group_ids = ["${aws_security_group.mysql_allow.id}"]
  storage_encrypted = "true"
  kms_key_id = "${aws_kms_key.mysql.key_id}"
  tags {
    Environment = "${var.environment}"
    Application = "${var.application}"
    Detail = "${var.detail}"
  }
}
