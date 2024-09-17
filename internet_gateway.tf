#configuring IGW 
resource "aws_internet_gateway" "Basiton_Gateway" {
  vpc_id = aws_vpc.Basiton_VPC.id
  tags = {
    "Name": "Basiton_Gateway"
  }
}

