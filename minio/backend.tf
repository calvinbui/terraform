terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "calvin"

    workspaces {
      name = "minio"
    }
  }
}
