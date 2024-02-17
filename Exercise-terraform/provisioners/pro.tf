provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  key_name      = "tf-key"


  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./tf-key.pem")
      host        = self.public_ip
    }
  }


}
