# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.group1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group1_igw.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}
# Route table association with public subnets
resource "aws_route_table_association" "a" {
  #count = length(var.subnets_cidr)
  subnet_id      = aws_subnet.group_Sub1.id
  route_table_id = aws_route_table.public_rt.id
}