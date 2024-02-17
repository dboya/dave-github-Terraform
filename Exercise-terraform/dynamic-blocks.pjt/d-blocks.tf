provider "aws" {
  region     = "us-east-1"
}


variable "ports" {
  type    = list(number)
  default = [8201, 8202, 8300, 9201]
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow TLS inbound traffic"


  ingress {
    from_port   = var.ports[0]
    to_port     = var.ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = var.ports[1]
    to_port     = var.ports[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.ports[2]
    to_port     = var.ports[2]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = var.ports[3]
    to_port     = var.ports[3]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/* NB:
    the above use of variable is acceptable and a strategic way to input values. however, in a case pf repetition such as creating many ingresses where only the numerical values do change we use the DYNAMIC BLOCK approach and in this case the "Dynamic ingress" as follows: */




variable "ports" {
  type    = list(number)
  default = [8201, 8202, 8300, 9201]
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow TLS inbound traffic"


  dynamic "ingress" {
    for_each = var.ports
    iterator = ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}  
