resource "aws_s3_bucket" "source" {
  bucket = var.source_bucket
}