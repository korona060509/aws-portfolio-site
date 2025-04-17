variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, prod)"
  type        = string
  default     = "dev"
}

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string
}

variable "error_html_path" {
  description = "Path to the error.html file"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  type        = string
  default     = ""  # デフォルト値を空文字列に設定
}
