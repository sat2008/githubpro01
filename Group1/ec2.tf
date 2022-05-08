provider "aws" {
  region = "us-east-1"
}

#create instance add to the subnet add ssh key for login assign security group 
resource "aws_instance" "centos" {
  subnet_id       =  aws_subnet.group_Sub1.id
  ami             = "ami-00e87074e52e6c9f9"
  instance_type   = "t2.micro"
  key_name        = "sg-AWS-Key"
   associate_public_ip_address = true
  #security_groups = ["${aws_security_group.allow_ssh.name}"]
  #security_groups =  aws_security_group.allow_ssh.name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 user_data = <<EOF
#! /bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1> Webserver from Soner<br>BigBoss</h1>" >> /var/www/html/index.html
EOF
  tags={
      Name="sg_ec1_01"
    }
}
#Create elastic Ip and attahced to the instance 
  resource "aws_eip" "sg01" {
    vpc = true 
    instance =  aws_instance.centos.id
    tags={
      Name="ec2_eip"
    }

  }

