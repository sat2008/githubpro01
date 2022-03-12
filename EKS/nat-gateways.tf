resource "aws_nat_gateway" "gw1" {
  # getting public ip from allocation ID of the Elastic IP address for the gateway 
  allocation_id = aws_eip.nat1.id

  # get public subnet id where the gateway will be placed default to internet, once the routing table created this will became public subnet 
  subnet_id = aws_subnet.public_1.id

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {
  # getting second public ip from allocation ID of the Elastic IP address for the gateway 
  allocation_id = aws_eip.nat2.id

  # get second public subnet id where the gateway will be placed default to internet, once the routing table created this will became public subnet 
  subnet_id = aws_subnet.public_2.id

  tags = {
    Name = "NAT 2"
  }
}