provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  subnet_id       =  aws_subnet.group_Sub1.id
  ami             = "ami-09d56f8956ab235b3"
  instance_type   = "t2.micro"
  #security_groups = ["${aws_security_group.allow_ssh.name}"]
  #security_groups =  aws_security_group.allow_ssh.name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

