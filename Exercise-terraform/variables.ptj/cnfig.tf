provider "aws" {
  region     = "us-east-1"
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow TLS inbound traffic"

}

resource "aws_vpc_security_group_ingress_rule" "ing1" {
  security_group_id = aws_security_group.private-sg.id

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = var.ip
}


resource "aws_vpc_security_group_ingress_rule" "ing2" {
  security_group_id = aws_security_group.private-sg.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = var.ip
}


