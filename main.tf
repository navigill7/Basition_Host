# Creating VPC for configuring custom subnet
resource "aws_vpc" "Basiton_VPC" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name":"Basiton_VPC"
  }
}
resource "aws_instance" "web-server-1" {
   ami = var.ami
   instance_type = var.instance_type
   subnet_id = aws_subnet.Basiton_Subnet_A1.id
   tags = {
     Name = "web-server-1"
   }
   key_name = "web-1"
   vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
   

}


resource "aws_security_group" "ssh-access" {
  vpc_id = aws_vpc.Basiton_VPC.id
  name        = "ssh-access"
  description = "Allow ssh access from the Internet"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web-server-2" {
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "web-server-2"
  }
  subnet_id = aws_subnet.Basiton_Subnet_A2.id
  key_name = "web-2"
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.ssh_access_web-server-2.id]

}

resource "aws_security_group" "ssh_access_web-server-2" {
  vpc_id = aws_vpc.Basiton_VPC.id
  name = "ssh_access_private"
  description = "Allowing ssh access for web-server 1"

  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/18"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}





