terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.81.0"
#     }
#   }
# }
resource "aws_security_group" "tool" {
  name        = "$(var.name)-sg"
  description = "$(var.name) security group"

  tags = {
    Name = "$(var.name)-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "ssh"
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.port
  ip_protocol       = "tcp"
  to_port           = var.port
  description       = var.name
}

resource "aws_vpc_security_group_egress_rule" "egress_allow_all" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "tool" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tool.id]
  # zone_id = var.zone_id

  tags = {
    Name = var.name
  }

}







