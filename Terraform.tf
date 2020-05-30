provider "aws" {
  access_key 		= "AKIA2JVRKZYFDWPZNGFB"
  secret_key 		= "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"
  region 			= var.aws_region
}

resource "aws_instance" "my-instance" {
  count         	= var.instance_count
  ami           	= var.ami
  instance_type 	= var.instance_type
  tags = {
    Name  			= "Terraform-Project-${count.index + 1}"
  }
}

variable "ami" {
  default 			= "ami-07dfba995513840b5"
}

variable "instance_count" {
  default 			= "2"
}

variable "instance_type" {
  default 			= "t2.micro"
}

variable "aws_region" {
  default = "eu-central-1"
}