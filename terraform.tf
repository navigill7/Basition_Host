terraform {
  backend "s3" {
    bucket = "basiton-s3-bucket-752"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}