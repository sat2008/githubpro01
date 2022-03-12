# resource: aws_eip
# This is to create ELastic IP address for the gateways
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "nat1" {

  # EIP may require IGW to exist prior to associtaion
  # Use depens_on to set an explicit dependecny on the IGW
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "main"
  }
}

#create sepearte NAT gateway for seperate AZ
resource "aws_eip" "nat2" {

  # EIP may require IGW to exist prior to associtaion
  # Use depens_on to set an explicit dependecny on the IGW
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "main"
  }
}