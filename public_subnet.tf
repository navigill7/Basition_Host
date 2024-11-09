# public subnet for AZ A
resource "aws_subnet" "Basiton_Subnet_A1" {
  vpc_id                  = aws_vpc.Basiton_VPC.id
  cidr_block              = var.subnet_A1_cidr
  availability_zone       = var.availability_zone_A
  map_public_ip_on_launch = true
  tags = {
    "Name" : "Basiton_Subnet_A1"
  }
}

# Public subnet for AZ B 
resource "aws_subnet" "Basiton_Subnet_B1" {
  vpc_id                  = aws_vpc.Basiton_VPC.id
  cidr_block              = var.subnet_B1_cidr
  availability_zone       = var.availability_zone_B
  map_public_ip_on_launch = true
  tags = {
    "Name" : "Basiton_Subnet_B1"
  }
}
