provider "aws" {
  region     = "us-east-1"
}



/*resource "aws_instance" "webserver" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
}*/

resource "aws_iam_user" "user" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.user[*].arn
}
