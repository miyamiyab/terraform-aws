terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.00"
    }
    backend "s3" {
    bucket = "miyashita-tfstate"
    region = "ap-northeast-1"
    key = "S3/terraform.tfstate"
    encrypt = true
  }
  }
  required_version = ">= 0.15.0"
}

provider "aws" {
  region  = "ap-northeast-1"
}
