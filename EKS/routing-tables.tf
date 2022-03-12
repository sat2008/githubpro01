
# three route table for public, private, internet 
resource "aws_route_table" "public" {
  #get VPC ID comes from the vpc file created
  vpc_id = aws_vpc.main.id

  route {
    # this is the default route 
    cidr_block = "0.0.0.0/0"

    # trafic is direverted to internet gateway id to handle 
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private1" {
  #get VPC ID comes from the vpc file created
  vpc_id = aws_vpc.main.id

  route {
    # this is the default route 
    cidr_block = "0.0.0.0/0"

    # trafic is targetin the first gateway created for private network in one AZ
    nat_gateway_id = aws_nat_gateway.gw1.id
  }

  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {
  #get VPC ID comes from the vpc file created
  vpc_id = aws_vpc.main.id

  route {
    # this is the default route 
    cidr_block = "0.0.0.0/0"

    # trafic is targetin the second gateeway created for private network trafiic will be diverted to second AZ
    nat_gateway_id = aws_nat_gateway.gw2.id
  }

  tags = {
    Name = "private2"
  }
}