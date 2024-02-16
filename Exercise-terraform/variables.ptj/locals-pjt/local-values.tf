/* LOCAL VALUES:
These local values function similarly to variables but are usually or often used to labell local resources using tags. e.g. creating resources for Dev and Prod teams, reources are labelled to faciliate identification of resource allocation. see following example: */


provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "CUDgPXv0MxcKk7SSFuybY6VqHg4ZL2LaWQaEpLvV"
}

locals {
  common_tag = {
    owner   = "Dev"
    service = "Hotfix-branch"
  }
}


resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  tags          = local.common_tag
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1"
  size              = 10
  tags              = local.common_tag
}

