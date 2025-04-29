variable "source_bucket" {
  description = "The name of the source S3 bucket"
  type        = string
}

variable "destination_bucket" {
  description = "The name of the destination S3 bucket"
  type        = string
}
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
variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  
}
variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "python3.9"

}
variable "lambda_role_arn" {
  description = "The ARN of the IAM role for the Lambda function"
  type        = string
  
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"

}
variable "source_code_path" {
  description = "The path to the source code for the Lambda function"
  type        = string
  default     = "${path.module}/lambda/lambda_function.zip"
  
}