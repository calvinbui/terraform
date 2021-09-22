resource "minio_s3_bucket" "main" {
  for_each = { for b in local.buckets : b.name => b }

  bucket = each.value.name
  acl    = each.value.acl
}

data "minio_iam_policy_document" "main" {
  for_each = { for b in local.buckets : b.name => b }

  statement {
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${minio_s3_bucket.main[each.value.name].bucket}",
      "arn:aws:s3:::${minio_s3_bucket.main[each.value.name].bucket}/*",
    ]
  }
}

resource "minio_iam_policy" "main" {
  for_each = { for b in local.buckets : b.name => b }

  name   = "${each.value.name}-policy"
  policy = data.minio_iam_policy_document.main[each.value.name].json
}

resource "minio_iam_user" "main" {
  for_each = { for b in local.buckets : b.name => b }

  name = each.value.name
}

resource "minio_iam_user_policy_attachment" "main" {
  for_each = { for b in local.buckets : b.name => b }

  user_name   = minio_iam_user.main[each.value.name].id
  policy_name = minio_iam_policy.main[each.value.name].id
}
