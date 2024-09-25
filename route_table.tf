# configuring the routes for internet gateway to public subnet in AZ A 
  resource "aws_route_table" "IGW_Route" {
    vpc_id = aws_vpc.Basiton_VPC.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Basiton_Gateway.id
    }

    tags = {
        Name = "TerraformPublicRT"
    }
  }

  resource "aws_route_table_association" "subnet_association_IGW" {
    subnet_id = aws_subnet.Basiton_Subnet_A1.id
    route_table_id = aws_route_table.IGW_Route.id

  }
  resource "aws_route_table_association" "subnet_association_IGW_2" {
    subnet_id = aws_subnet.Basiton_Subnet_B1.id
    route_table_id = aws_route_table.IGW_Route.id
  }


# configuring the route table for NAT gate ways in AZ A 

resource "aws_route_table" "NAT_ROUTE_A" {
  vpc_id = aws_vpc.Basiton_VPC.id

  route  {
    cidr_block = "192.168.0.0/18"
    nat_gateway_id = aws_nat_gateway.NAT_A.id
  }

  tags = {
    Name = "TerraformNATA"
  }
}

resource "aws_route_table_association" "Subnet_association_NAT_A" {
  subnet_id = aws_subnet.Basiton_Subnet_A2.id
  route_table_id = aws_route_table.NAT_ROUTE_A.id
}

# configuring route table for NAT gateway in AZ B

resource "aws_route_table" "NAT_ROUTE_B" {
  vpc_id = aws_vpc.Basiton_VPC.id

  route  {
    cidr_block = var.subnet_B1_cidr
    nat_gateway_id = aws_nat_gateway.NAT_B.id
  }

  tags = {
    Name = "TerraformNATB"
  }

}


resource "aws_route_table_association" "Subnet_association_NAT_B" {
  route_table_id = aws_route_table.NAT_ROUTE_B.id
  subnet_id = aws_subnet.Basiton_Subnet_B2.id
}


