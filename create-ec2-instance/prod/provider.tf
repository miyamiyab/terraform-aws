terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
    bucket  = "miyashita-tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "shino_admin"
  region  = "ap-northeast-1"
}