# Route table: attach to the Internet Gateway with all port open
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
# Route table needs to be associated with public subnets
resource "aws_route_table_association" "a" {
  #count = length(var.subnets_cidr)
  subnet_id      = aws_subnet.group_Sub1.id
  route_table_id = aws_route_table.public_rt.id
}