# creating s3 bucket for storing terraform.tfstate file 
resource "aws_s3_bucket" "State_bucket" {
  bucket = "basiton-s3-bucket-751"
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket_versioning" "versions3" {
  bucket = aws_s3_bucket.State_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_s3" {
  bucket = aws_s3_bucket.State_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    
  }
  lifecycle {
    prevent_destroy = true
  }
}
# creating aws dynamodb for enabling state locking 
resource "aws_dynamodb_table" "statelocking" {
  name         = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

}