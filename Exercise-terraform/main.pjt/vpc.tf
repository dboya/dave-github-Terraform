provider "aws" {
  region     = "us-east-1"
}


resource "aws_vpc" "vpc-tf" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc-tf.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

}
