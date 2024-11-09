terraform {
  backend "s3" {
    bucket         = "basiton-s3-bucket-751"
    dynamodb_table = "state-lock"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }


}