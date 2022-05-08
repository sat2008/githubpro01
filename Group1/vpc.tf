resource "aws_vpc" "group1" {
  cidr_block = "192.168.0.0/16"

  #make your instances shared on the host
  //instance_tenancy = "default"
  tags = {
    Name = "group1"
  }
}

#out put vpc id so other resources can  assgin 
output "vcp_id" {
  value       = aws_vpc.group1.id
  description = "VCP_Id"
  sensitive   = false

}
