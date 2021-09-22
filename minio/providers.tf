provider "minio" {
  minio_server     = var.MINIO_ENDPOINT
  minio_access_key = var.MINIO_ACCESS_KEY
  minio_secret_key = var.MINIO_SECRET_KEY
  minio_ssl        = true
}

provider "aws" {
  access_key = var.MINIO_ACCESS_KEY
  secret_key = var.MINIO_SECRET_KEY
  region     = "us-east-1"

  endpoints {
    s3 = "https://${var.MINIO_ENDPOINT}"
  }

  skip_credentials_validation = true
  skip_get_ec2_platforms      = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
}

variable "MINIO_ENDPOINT" {}
variable "MINIO_ACCESS_KEY" {}
variable "MINIO_SECRET_KEY" { sensitive = true }
