provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}


resource "aws_vpc" "prod-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

}

resource "aws_subnet" "private-subnet" {
  vpc_id            = "aws_vpc.prod-vpc.id"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

}


/*
resource "aws_s3_bucket" "s3-tf" {
  bucket = "s3-tf-bucket"
  region = "us-east-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}*/

/*
resource "aws_dynamodb_table" "db-tf" {
  
} */
/*
terraform {
  backend "s3" {
    bucket = "s3-tf-bucket"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}*/
