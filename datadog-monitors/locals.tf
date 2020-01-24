locals {
  tags = [
    "managedby:terraform"
  ]
}

variable "notify_email" {}
variable "notify_mattermost" {}