resource "aws_db_parameter_group" "mysql" {
  name = "${var.application}-${var.environment}-${var.detail}"
  family = "mysql5.6"

  parameter {
    name = "character_set_server"
    value = "utf8"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "collation_server"
    value = "utf8_general_ci"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "tmp_table_size"
    value = "{DBInstanceClassMemory/16}"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "max_heap_table_size"
    value = "{DBInstanceClassMemory/16}"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "query_cache_type"
    value = "1"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "query_cache_size"
    value = "33554432"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "table_open_cache"
    value = "2500"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "join_buffer_size"
    value = "{DBInstanceClassMemory/64}"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "thread_cache_size"
    value = "{DBInstanceClassMemory/12582880}"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "sort_buffer_size"
    value = "{DBInstanceClassMemory/64}"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "innodb_flush_log_at_trx_commit"
    apply_method = "pending-reboot"
    value = "1"
  }
  parameter {
    name = "slow_query_log"
    value = "1"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "max_allowed_packet"
    value = "33554432"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "innodb_write_io_threads"
    value = "16"
    apply_method = "pending-reboot"
  }
  parameter {
    name = "innodb_read_io_threads"
    value = "16"
    apply_method = "pending-reboot"
  }
}