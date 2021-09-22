locals {
  buckets = [
    {
      name = "octoprint"
      acl  = "public"
    },
    {
      name = "mattermost"
      acl  = "private"
    },
  ]
}
