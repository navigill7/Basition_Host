variable "region" {
  default = "us-east-1"
}


variable "availability_zone_A" {
    default = "us-east-1a"
}
variable "availability_zone_B" {
  default = "us-east-1b"
}
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}
variable "subnet_A1_cidr" {
  default = "192.168.0.0/18"
}
variable "subnet_A2_cidr" {
  default = "192.168.64.0/18"
}
variable "subnet_B1_cidr" {
  default = "192.168.128.0/18"
}
variable "subnet_B2_cidr" {
  default = "192.168.192.0/18"
}
variable "ami" {
  default = "ami-0e86e20dae9224db8"
}
variable "instance_type" {
  default = "t2.micro"
}