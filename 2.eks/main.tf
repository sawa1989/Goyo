terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "literary-goyo-s3"
    key            = "ap-northeast-2/eks/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "literary-goyo-table"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
  default_tags {
      tags = {
        Owner = "kyoin"
      }
    }
}

data "aws_default_tags" "aws_dt" {}
