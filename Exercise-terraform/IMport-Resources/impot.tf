provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}

/*resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}*/


resource "aws_instance" "myEc2" {
  ami                    = "ami-05c13eab67c5d8861"
  instance_type          = "t2.micro"
  key_name               = "tf-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0ccc68291215efd98"]
  subnet_id              = "subnet-040580ba9f8b38aec"

  tags = {
    name = "single-instance"

  }
}
