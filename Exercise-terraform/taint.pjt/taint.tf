provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}



/* TAINT.......Tainting a Resource.
    if  a resource is marked as taint in terraform, it means that the resource will de Destroyed and recreated at the next " terraform apply" command. 
            once the taint command is issued it gets registered in the "state file" which then keeps the destruction and recreation information.

            the command is: "terraform taint 'resource name'" for exampel:
            terraform taint aws_instance.webserver
            */
