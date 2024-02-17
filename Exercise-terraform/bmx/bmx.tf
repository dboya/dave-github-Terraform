provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}


terraform {
  backend "s3" {
    bucket = "mys3-bmx453215"
    region = "us-east-1"
    key    = "bmx.tfstate"
  }
}

/* note that state files are stored in s3 and locked with dynamodb table. At the time of creation of the table, a "partition key" must be specified for, its the key which is used to access contents within the table. A sort key could as well be created but its optional. both keys are in the form of "string". To lock the contents  in the s3 all you need to do is to mention the dynamodb table and the name of the table as follows:

terraform {
  backend "s3" {
    bucket = "mys3-bmx453215"
    region = "us-east-1"
    key    = "bmx.tfstate"
    dynamodb_table = "name of the Dynamodb table"
  }
}  
*/
