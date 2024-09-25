# configuring the routes for internet gateway to public subnet in AZ A 
resource "aws_route_table" "IGW_Route_table" {
  vpc_id = aws_vpc.Basiton_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Basiton_Gateway.id
  }
  tags = {
    Name: "IGW_Route_table"
  }
}
resource "aws_route_table_association" "IGW_Route_table_SubnetA" {
  route_table_id = aws_route_table.IGW_Route_table.id
  subnet_id = aws_subnet.Basiton_Subnet_A1.id
  
}
resource "aws_route_table_association" "IGW_Route_table_SubnetB" {
  route_table_id = aws_route_table.IGW_Route_table.id
  subnet_id = aws_subnet.Basiton_Subnet_B1.id
}

resource "aws_route_table" "NATA_route_table" {
  vpc_id = aws_vpc.Basiton_VPC.id
  route  {
    cidr_block = "192.168.0.0/18"
    nat_gateway_id = aws_nat_gateway.NAT_A.id
  }
}

resource "aws_route_table_association" "NATA_Subnet_association" {
  route_table_id = aws_route_table.NATA_route_table.id
  subnet_id = aws_subnet.Basiton_Subnet_A2.id
}


resource "aws_route_table" "NATB_route_table" {
  vpc_id = aws_vpc.Basiton_VPC.id
  route  {
    cidr_block = "192.168.64.0/18"
    nat_gateway_id = aws_nat_gateway.NAT_B.id
  }
}


resource "aws_route_table_association" "NATB_Subnet_association" {
  route_table_id = aws_route_table.NATB_route_table.id
  subnet_id = aws_subnet.Basiton_Subnet_B2.id
}


