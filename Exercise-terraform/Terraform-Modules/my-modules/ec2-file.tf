provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}

/*resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}*/


module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "tf-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0ccc68291215efd98"]
  subnet_id              = "subnet-040580ba9f8b38aec"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
