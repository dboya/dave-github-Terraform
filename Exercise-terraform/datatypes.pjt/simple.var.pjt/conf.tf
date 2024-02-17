provider "aws" {
  region     = "us-east-1"
}


resource "aws_iam_user" "user" {
  name = var.terraform-user /*the "name" under resource type must match with the variable resource name in the var.tf file*/
  path = "/system/"


}
