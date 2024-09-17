# Private subnet for AZ A 
resource "aws_subnet" "Basiton_Subnet_A2" {
  vpc_id = aws_vpc.Basiton_VPC.id
  cidr_block = var.subnet_A2_cidr
  availability_zone = var.availability_zone_A
  tags = {
    "Name": "Basiton_Subnet_A2"
  }
}

# Private subnet for AZ B

resource "aws_subnet" "Basiton_Subnet_B2" {
  vpc_id = aws_vpc.Basiton_VPC.id
  cidr_block = var.subnet_B2_cidr
  availability_zone = var.availability_zone_B
  tags = {
    "Name": "Basiton_Subnet_B2"
  }
}