resource "aws_security_group" "allow_ssh" {
  vpc_id     = aws_vpc.group1.id
  name        = "allow_ssh"
  description = "Allow ssh traffic"

  ingress {
    from_port = 22 #  By default, 22 SSH
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
