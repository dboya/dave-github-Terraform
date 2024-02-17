provider "aws" {
  region     = "us-east-1"
}

/*resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = var.list[2]

}*/

/*variable "list" {
  type    = list(any)
  default = ["m5.large", "m5.xlarge", "t2.micro"]

}*/

/* with variable type list, each value in the list is attributed a numerical value starting from zero (0)and ascending corresponding to the order as listed. thus calling a particular value requires selecting its corresponding numerical value in bracket (at the end of the referenced variable) at the level of the resource e.g. m5.large=0, m5.xlarge=1, t2.micro=2.
  NB: A list is always expressed in Square brackets */




resource "aws_instance" "Appserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = var.types["us-east-1a"]

}

variable "types" {
  type = map(any)
  default = {
    us-east-1a = "t2.micro"
    us-east-1b = "t2.nano"
    us-east-1c = "t2.small"
  }

}

/* with maps, attributes are expressed in a key-value pair. Referencing the value requires its key be referenced in a square bracket at the end of the reference variable within the resource */
