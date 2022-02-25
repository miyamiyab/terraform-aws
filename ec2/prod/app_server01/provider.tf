terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74"
    }
  }
  backend "s3" {
    bucket         = "miyashita-tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "terraform_state_lock"
  }
  required_version = "~> 1.1.6"
}

provider "aws" {
  profile = "shino_admin"
  region  = "ap-northeast-1"
}