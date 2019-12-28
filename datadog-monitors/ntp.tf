resource "datadog_monitor" "ntp" {
  name    = "NTP Out of Sync - {{host.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"ntp.in_sync\".over(\"*\").last(2).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 1
  }

  no_data_timeframe = 0

  tags = local.tags
}
