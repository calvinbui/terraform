terraform {
  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "~> 1.2.0"
    }
  }
  required_version = "~> 1.0.4"
}
