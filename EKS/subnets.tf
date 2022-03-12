resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/18"

  #AZ for the subnet
  availability_zone = "us-east-1a"

  #public ip address Required by EKS every new instnance will get public Ip (will only used for LB)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_us-east-1a"
    # allow this subnet to discover use 
    "kubernetes.io/cluster/eks" = "shared"
    #mandatory when creating publik LB kubernetes will discover and put LB is in that subnet
    "kubernets.io/role/elb" = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.64.0/18"

  #AZ for the subnet
  availability_zone = "us-east-1b"

  #public ip address Required by EKS every new instnance will get public Ip (will only used for LB)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_us-east-1b"
    # allow this subnet to discover use 
    "kubernetes.io/cluster/eks" = "shared"
    #Privite subnet LB kubernetes will discover and put LB is in that subnet
    "kubernets.io/role/elb" = 1
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.128.0/18"

  #AZ for the subnet
  availability_zone = "us-east-1a"

  #public ip address Required by EKS every new instnance will get public Ip (will only used for LB)
  map_public_ip_on_launch = true

  tags = {
    Name = "private_us-east-1a"
    # allow this subnet to discover use 
    "kubernetes.io/cluster/eks" = "shared"
    #creating privite internal LB kubernetes will discover and put LB is in that subnet
    "kubernets.io/role/internal_elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.192.0/18"

  #AZ for the subnet
  availability_zone = "us-east-1b"

  #public ip address Required by EKS every new instnance will get public Ip (will only used for LB)
  map_public_ip_on_launch = true

  tags = {
    Name = "private_us-east-1b"
    # allow this subnet to discover use 
    "kubernetes.io/cluster/eks" = "shared"
    #creating privite internal LB kubernetes will discover and put LB is in that subnet
    "kubernets.io/role/internal_elb" = 1
  }
}