resource "datadog_monitor" "ntp" {
  name    = "NTP Clock Out of Sync"
  type    = "service check"
  message = var.notify_email

  query = "\"ntp.in_sync\".over(\"*\").by(\"host\").last(2).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 1
  }

  tags = local.tags
}
