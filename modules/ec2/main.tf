terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
  required_version = ">= 0.14.9"
}


resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = "t2.micro"
}

