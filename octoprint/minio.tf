resource "minio_s3_bucket" "main" {
  bucket = "octoprint"
  acl    = "public"
}

resource "minio_iam_user" "main" {
  name = "octoprint"
}
