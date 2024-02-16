/*provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}*/

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}

/* A) OUTPUT  in terraform*/



/* using "OUTPUT" in terraform and its related attributes.
 the resource used for an example here is an ec2 instance
}*/

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.webserver.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.webserver.public_ip
}


/* "Output EC2 instance configuration"
the sentence to use when you wish to search
 for output values for any particular resource.*/


/* B) VARIBLES in Terraform */


/* using "VARIABLES" in terraform and its related attributes.
 the resource used for an example here is an ec2 instance
}*/

resource "aws_eip" "myeip" {
  instance = aws_instance.webserver.id
  domain   = "vpc"
}


resource "aws_eip_association" "myeip_assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.myeip.id
}
