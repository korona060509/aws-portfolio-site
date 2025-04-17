provider "aws" {
  region = var.aws_region
}

# S3モジュール
module "s3" {
  source = "./modules/s3"

  bucket_name     = var.bucket_name
  environment     = var.environment
  index_html_path = "${path.module}/index.html"
  error_html_path = "${path.module}/error.html"
}

# CloudFrontモジュール
module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_name       = var.bucket_name
  bucket_domain_name = module.s3.bucket_regional_domain_name
  environment       = var.environment
  price_class       = var.cloudfront_price_class

  depends_on = [module.s3]
}

# S3バケットポリシーモジュール
module "bucket_policy" {
  source = "./modules/bucket_policy"

  bucket_id                  = module.s3.bucket_id
  bucket_arn                 = module.s3.bucket_arn
  cloudfront_distribution_arn = module.cloudfront.distribution_arn

  depends_on = [module.s3, module.cloudfront]
}
