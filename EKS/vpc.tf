
resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"

  #make your instances shared on the host
  instance_tenancy = "default"
  #required by eks enable/disblae dns support in the vpc
  enable_dns_support = true
  #required hostname dns 
  enable_dns_hostnames             = true
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "main"
  }
}

output "vcp_id" {
  value       = aws_vpc.main.id
  description = "VCP_Id"
  sensitive   = false

}
