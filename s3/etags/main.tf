terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}
resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
  bucket = resource.aws_s3_bucket.default
  key    = "myfile.txt"
  source = "myfile.txt"
  etag = filemd5("path/to/file")
}