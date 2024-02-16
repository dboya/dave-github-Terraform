provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = lookup(var.my-wspace, terraform.workspace)

}

variable "my-wspace" {
  type = map(string)
  default = {
    default    = "t2.small"
    dev        = "t2.micro"
    production = "t2.nano"
    staging    = "t2.micro"
  }
}
