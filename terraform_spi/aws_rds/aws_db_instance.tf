provider "aws" {
  access_key = "AKIAISMZOGNJGUASV4UA"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 500
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.4.11-R1"
  instance_class       = "db.r3.xlarge"
  name                 = "spidb"
  username             = "postgres"
  password             = "postgres"
  db_subnet_group_name = "my_database_subnet_group"
  parameter_group_name = "default.post9.4.11-R1"
}