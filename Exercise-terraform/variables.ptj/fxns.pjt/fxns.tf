provider "aws" {
  region     = "us-east-1"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"      = "ami-079db87dc4c10ac91"
    "us-west-2"      = "ami-0082110c417e4726e"
    "ap-southeast-1" = "ami-0e4b5d31e60aa0acd"
  }
}

variable "region" {
  default = "us-east-1"
}


resource "aws_instance" "EC2" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
}


output "timestamp" {
  value = local.time
}
