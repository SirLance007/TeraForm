resource "aws_s3_bucket" "example" {
  bucket = "prankur-sharma-my-tf-test-bucket"

  force_destroy = true
}