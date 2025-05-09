provider "aws" {
  region              = "ap-south-1"
  
}
terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.29.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.2.0"
    }
  }
    backend "s3" {
    bucket = "shashikanth-s3"
    key    = "shashi/terraform.tfstate"
    region = "us-east-1"
  }
}
