terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.00"
    }
  }
  required_version = ">= 0.15.0"
}

provider "aws" {
  region  = "ap-northeast-1"
  assume_role {
    role_arn     = var.assume_role_arn
  }
}
