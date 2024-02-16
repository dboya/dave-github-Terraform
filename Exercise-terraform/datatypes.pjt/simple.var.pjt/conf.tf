provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW7MRKFNNL2UPOUHV"
  secret_key = "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"
}


resource "aws_iam_user" "user" {
  name = var.terraform-user /*the "name" under resource type must match with the variable resource name in the var.tf file*/
  path = "/system/"


}
