provider "aws" {
  region     = "us-east-1"
}


variable "list" {
  type    = list(any)
  default = ["m5.large", "m5.xlarge", "t2.micro"]
}


variable "flag" {}

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = var.list[2]
  count         = var.flag == true ? 3 : 0
}

resource "aws_instance" "Appserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = var.list[0]
  count         = var.flag == false ? 1 : 0

}

/*variable "types" {
  type = map(any)
  default = {
    us-east-1a = "t2.micro"
    us-east-1b = "t2.nano"
    us-east-1c = "t2.small"
  }

}*/

