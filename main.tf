module "source_bucket" {
  source = "./modules/source_bucket"
  source_bucket = var.source_bucket
}

module "destination_bucket" {
  source = "./modules/destination_bucket"
  destination_bucket = var.destination_bucket
}
module "lambda_role_policy" {
  source = "./modules/IAM_Role"
  lambda_role_name = var.lambda_role_name
  lambda_policy = var.lambda_policy
  destination_bucket_arn = module.destination_bucket.destination_bucket_arn
  source_bucket_arn = module.source_bucket.source_bucket_arn
}
module "lambda_function" {
  source = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  runtime = var.runtime
  lambda_role_arn = module.lambda_role_policy.lambda_role_arn
  lambda_handler = var.lambda_handler
  source_code_path = var.source_code_path
  source_bucket = module.source_bucket.source_bucket_name
  destination_bucket = module.destination_bucket.destination_bucket_name
}