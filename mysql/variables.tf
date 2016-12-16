variable "environment" {

}

variable "application" {

}

variable "detail" {

}
variable "db_instance_type" {
  default = "db.t2.micro"
}
variable "allocated_storage" {
  default = "100"
}
variable "master_username" {
  default = "rdsroot"
}
variable "master_password" {

}
variable "db_subnet_group" {

}
variable "db_engine_version" {
  default = "5.6.27"
}
variable "source_security_group_ids" {
  type = "list"
}
variable "multi_az" {
  default = false
}