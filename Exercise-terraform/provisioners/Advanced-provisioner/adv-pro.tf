provider "aws" {
  region     = "us-east-1"
}


resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow TLS inbound traffic"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "webserver" {
  ami                    = "ami-05c13eab67c5d8861"
  instance_type          = "t2.micro"
  key_name               = "tf-key"
  vpc_security_group_ids = [aws_security_group.private-sg.id]


  provisioner "remote-exec" {
    on_failure = continue /* this parameter must not be there. only use when the project must complete*/
    inline = [
      "sudo yum install nano -y"

    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum remove nano -y"
    ]
  }


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./tf-key.pem")
    host        = self.public_ip
  }
}






