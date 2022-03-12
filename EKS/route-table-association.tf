resource "aws_route_table_association" "public1" {
  # Public subnet 1 thi is the subnet id comae form public_1 to create association
  subnet_id = aws_subnet.public_1.id

  #The id of the routing table comes from the route table file public to associate with
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  # Public subnet 2 thi is the subnet id comae form public_2 to create association
  subnet_id = aws_subnet.public_2.id

  #The id of the routing table comes from the route table file public to associate with
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  #Private subnet 1 thi is the subnet id comae form private_1 to create association
  subnet_id = aws_subnet.private_1.id

  #The id of the routing table comes from the route table file public to associate with first natgateway
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  #Private subnet 2 thi is the subnet id come  to create association
  subnet_id = aws_subnet.private_2.id

  #The id of the routing table comes from the route table file public to associate with second natgateway
  route_table_id = aws_route_table.private2.id
}

