module "source_bucket" {
  source = "./modules/S3_source"
  source_bucket = var.source_bucket
}

module "destination_bucket" {
  source = "./modules/s3_dist"
  distination_bucket = var.distination_bucket
}
module "lambda_role_policy" {
  source = "./modules/IAM_Role"
  lambda_role_name = var.lambda_role_name
  lambda_policy = var.lambda_policy
  destination_bucket_arn = module.destination_bucket.destination_bucket_arn
  source_bucket_arn = module.source_bucket.source_bucket_arn
}
locals {
  source_code_path = "./lambda/image_processor.zip"
}
module "lambda_function" {
  source = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  runtime = var.runtime
  lambda_role_arn = module.lambda_role_policy.lambda_role_arn
  lambda_handler = var.lambda_handler
  source_code_path = local.source_code_path
  source_bucket = module.source_bucket.source_bucket_name
  destination_bucket = module.destination_bucket.destination_bucket_name

}
module "lambda_permission" {
  source = "./modules/lamdba_permision"
  source_bucket_arn = module.source_bucket.source_bucket_arn
  lambda_function_name = module.lambda_function.lambda_function_name
  
}
module "S3_event" {
  source = "./modules/S3_event"
  source_bucket_name = module.source_bucket.source_bucket_name
  lambda_function_arn = module.lambda_function.lambda_function_arn
  depends_on = [module.lambda_permission]
}

