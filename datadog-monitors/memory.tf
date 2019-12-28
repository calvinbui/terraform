resource "datadog_monitor" "mem-low" {
  name    = "Memory - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "max(last_5m):sum:system.mem.pct_usable{*} by {host} < 0.1"

  thresholds = {
    critical = 0.1
  }

  no_data_timeframe = 0

  tags = local.tags
}
