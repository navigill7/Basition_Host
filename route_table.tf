# configuring the routes for internet gateway to public subnet in AZ A 
  resource "aws_route_table" "IGW_Route" {
    vpc_id = aws_vpc.Basiton_VPC.id

    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.id
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
