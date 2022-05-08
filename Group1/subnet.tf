#create internal local subnet and assagine to the vpc
resource "aws_subnet" "group_Sub1" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = "192.168.0.0/18"
  tags = {
    Name = "group_sub1-east-1a"
  }
}