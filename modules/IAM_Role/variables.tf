variable "lambda_role_name" {
    description = "The name of the IAM role for the Lambda function"
    type        = string
}
variable "lambda_policy" {
    description = "The name of the IAM policy for the Lambda function"
    type        = string
}
variable"destination_bucket_arn" {
    description = "The ARN of the destination S3 bucket"
    type        = string
}
variable "source_bucket_arn" {
    description = "The ARN of the source S3 bucket"
    type        = string
  
}