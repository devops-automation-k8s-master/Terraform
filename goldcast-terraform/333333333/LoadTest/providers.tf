terraform {
  backend "s3" {
    bucket = "terraform-anavar-test-bucket"
    encrypt = true
    key = "goldcast-test/vpc-rds/vpc-rds.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = var.region
}
