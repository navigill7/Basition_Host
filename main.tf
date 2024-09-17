# Creating VPC for configuring custom subnet
resource "aws_vpc" "Basiton_VPC" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name":"Basiton_VPC"
  }
}





