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

resource "aws_s3_bucket" "mys4-bmx" {
  bucket = "mys3-bmx453215"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


/* below is the remote backend to upload a file to the s3 bucket using terraform. the main components here are just bucket(name of the bucket u are using) and key (name of the object or file you are uploading to the bucket). if the uploading configuration is alone in a .tf file, then you must specify the region, access_key and secret_key.*/

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

/* below is the configuration used to upload a file (an object) in an s3 bucket. main requirements here are bucket (name of bucket) , key and source (path to the file or object you are trying to upload). however, note that if you are using a bucket that you created on the same .tf file, then bucket (becomes the aws resource name plus id as follows:
 aws_s3_bucket.mys3-bmx.id).

resource "aws_s3_object" "file" {
  bucket = "aws_s3_bucket.mys3-bmx.id"
  key    = "cmx.txt"
  source = "C:/Users/Boya DA/Exercise-terraform/belowe/cmx.txt"
}*/

