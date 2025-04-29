resource "aws_lambda_function" "image_processor" {
  filename         = var.source_code_path
  function_name    = var.lambda_function_name
  role             = var.lambda_role_arn
  handler          = var.lambda_handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.source_code_path)
}
