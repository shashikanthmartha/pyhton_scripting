resource "aws_s3_bucket_notification" "source_bucket_notification" {
  bucket = var.source_bucket_name

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }


}