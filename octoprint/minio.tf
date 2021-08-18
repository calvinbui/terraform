resource "minio_s3_bucket" "main" {
  bucket = local.app
  acl    = "public"
}

data "minio_iam_policy_document" "main" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::${minio_s3_bucket.main.bucket}",
    ]
  }

  statement {
    actions = [
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${minio_s3_bucket.main.bucket}/*",
    ]
  }
}

resource "minio_iam_policy" "main" {
  name   = "${local.app}-policy"
  policy = data.minio_iam_policy_document.main.json
}

resource "minio_iam_user" "main" {
  name = local.app
}
resource "minio_iam_user_policy_attachment" "main" {
  user_name   = minio_iam_user.main.id
  policy_name = minio_iam_policy.main.id
}
