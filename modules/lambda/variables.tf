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
  default     = "lambda_function.zip"
  
}