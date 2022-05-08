resource "aws_internet_gateway" "group1_igw" {
  vpc_id = aws_vpc.group1.id

  tags = {
    Name = "group1_igw"
  }
}