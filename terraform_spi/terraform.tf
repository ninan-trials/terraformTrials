provider "aws" {
  access_key = "AKIAISMZOGNJGUASV4UA"
  secret_key = "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"
  region     = "ap-south-1"
}


module "app_server"{
  source = "./module/app_server"
  no_of_servers = 4
  server_name = "app_server"
  instance_type = "c4.xlarge"
  ports_to_open = [8080,8081,8082,8083]
  vpc_id = "${var.vpc_id}"
  allowed_address = "${var.allowed_address}"
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "cc_server"{
  source = "./module/app_server"
  no_of_servers = 1
  server_name = "cc_server"
  instance_type = "c4.xlarge"
  ports_to_open = [8080,8081]
  vpc_id = "${var.vpc_id}"
  allowed_address = "${var.allowed_address}"
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "job_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "job_server"
  instance_type = "r4.xlarge"
  ports_to_open = [8000,8001,6379,6380,26380,26379]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "external_nginx_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "external_nginx_server"
  instance_type = "c4.2xlarge"
  ports_to_open = [80,443]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${subnet_id}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "internal_nginx_server" {
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "internal_nginx_server"
  instance_type = "c4.xlarge"
  ports_to_open = [8080,8081,8082,8083]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "notification_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "notification_server"
  instance_type = "c4.xlarge"
  ports_to_open = [7001,7002]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "vista_dw_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "vista_dw_server"
  instance_type = "c4.2xlarge"
  ports_to_open = [8080,8081]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "vista_cc_dw_server"{
  source = "./module/app_server"
  no_of_servers = 1
  server_name = "vista_cc_dw_server"
  instance_type = "c4.xlarge"
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  ports_to_open = ["8080","8081"]
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "oauth_server"{
  source = "./module/app_server"
  no_of_servers = 3
  server_name = "oauth_server"
  instance_type = "c4.2xlarge"
  ports_to_open = [3000,3001,3002]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "payment_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "payment_server"
  instance_type = "c4.xlarge"
  ports_to_open = [8090,8091,2379]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "wallet_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "wallet_server"
  instance_type = "c4.xlarge"
  ports_to_open = [7070,7071]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "rabbit_mq_server"{
  source = "./module/app_server"
  no_of_servers = 2
  server_name = "rabbit_mq_server"
  instance_type = "c4.xlarge"
  ports_to_open = [8080,8081,8082,8083]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "maya_server"{
  source = "./module/app_server"
  no_of_servers = 1
  server_name = "maya_server"
  instance_type = "c4.xlarge"
  ports_to_open = [80,22]
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "prebook_server"{
  source = "./module/app_server"
  no_of_servers = 1
  server_name = "prebook_server"
  instance_type = "c4.xlarge"
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  ports_to_open = ["8080","8081"]
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
}

module "postgres_servers"{
  source = "./module/data_server"
  no_of_servers = 2
  server_name = "postgres_server"
  instance_type = "c4.2xlarge"
  vpc_id = "${var.vpc_id}"
  allowed_address = ["${var.allowed_address}"]
  env = "${var.env}"
  ports_to_open = ["8080","8081"]
  subnet_id = "${var.subnet_id}"
  availability_zones = ["${var.availability_zones}"]
  data_size = 250
  os_disk_size = 30
}
