variable "env" {
  default = "uat"
}

variable "allowed_address" {
  type = "list"
  default = ["192.168.0.0/16","182.73.66.66/32","172.172.0.0/19"]
}

variable "vpc_id" {
  type = "string"
  default = "vpc-9854eef1"
}

variable "subnet_id" {
  type = "string"
  default = "subnet-29c10464"
}

variable "availability_zones"  {
  type = "list"
  default = ["ap-south-1b", "ap-south-1b"]
}

variable "ssh_key" {
  type = "string"
  default = "UAT"
}
