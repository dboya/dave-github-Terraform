provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
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
