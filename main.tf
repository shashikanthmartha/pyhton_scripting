module "source_bucket" {
  source = "./modules/source_bucket"
  source_bucket = var.source_bucket
}

module "destination_bucket" {
  source = "./modules/destination_bucket"
  destination_bucket = var.destination_bucket
}