variable "no_of_servers" {}
variable "server_name" {}
variable "instance_type" {}
variable "env" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "allowed_address" { type = "list"}
variable "ports_to_open" { type = "list"}
variable "availability_zones" { type = "list"}
variable "os_disk_size" { }
variable "data_size" { }

module "security_group"{
  source = "./../security_group"
  server_name = "${var.server_name}"
  ports_to_open = "${var.ports_to_open}"
  vpc_id = "${var.vpc_id}"
  allowed_address = "${var.allowed_address}"
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
}

resource "aws_instance" "server" {
  count = "${var.no_of_servers}"
  ami = "ami-95cda6fa"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${module.security_group.security_group_id}"]
  tags = {
    "env"= "${var.env}",
    "function" = "${var.server_name}"
    "server_number" = "${(count.index)+1}"
    "creator" = "terraform"
  }
  availability_zone = "${element(var.availability_zones,((count.index)+1)%2)}"
  subnet_id = "${var.subnet_id}"
  key_name = "PROD"
  ebs_block_device = [
    {
      delete_on_termination = "true"
      device_name = "/dev/xvda"
      volume_size = "${var.data_size}"
      volume_type = "gp2"
    },
    {  
      delete_on_termination = "true"
      device_name = "/dev/xvdb"
      volume_size = "${var.os_disk_size}"
      volume_type = "gp2"
    }
  ]
}

resource "aws_eip" "elastic_ip" {
  count = "${var.no_of_servers}"
  instance = "${element(aws_instance.server.*.id, count.index)}"
}
