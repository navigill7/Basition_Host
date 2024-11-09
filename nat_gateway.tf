# for configuring NAT gateway , we have to create an elastic ip address 
resource "aws_eip" "NAT_EIP_1" {
  tags = {
    Name : "NAT_EIP_1"
  }
}

resource "aws_nat_gateway" "NAT_A" {
  allocation_id = aws_eip.NAT_EIP_1.id
  subnet_id     = aws_subnet.Basiton_Subnet_A1.id
  tags = {
    Name : "NAT_A"
  }
}

# configuring the NAT for another subnet in AZ B 

resource "aws_eip" "NAT_EIP_2" {
  tags = {
    Name : "NAT_EIP_2"
  }
}

resource "aws_nat_gateway" "NAT_B" {
  allocation_id = aws_eip.NAT_EIP_2.id
  subnet_id     = aws_subnet.Basiton_Subnet_B1.id

  tags = {
    Name : "NAT_B"
  }
}

