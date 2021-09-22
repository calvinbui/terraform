terraform {
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "~> 1.2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.59"
    }
  }
  required_version = "~> 1.0.4"
}
