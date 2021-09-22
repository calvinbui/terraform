locals {
  buckets = [
    {
      name = "octoprint"
      acl  = "public"
      ilm = [
        {
          id = "Old"
          expiration = {
            days = 14
          }
        }
      ],
    },
    {
      name = "mattermost"
      acl  = "private"
      ilm  = []
    },
  ]
}
