resource "aws_kms_key" "mysql" {
  description = "${var.application}-${var.environment}-${var.detail}"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "mysql" {
  name = "alias/${var.application}-${var.environment}-${var.detail}"
  target_key_id = "${aws_kms_key.mysql.key_id}"
}
