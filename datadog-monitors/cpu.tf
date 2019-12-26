resource "datadog_monitor" "cpu-high" {
  name    = "CPU - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "min(last_5m):sum:system.load.norm.1{*} by {host} > 0.9"

  thresholds = {
    critical = 0.9
  }

  tags = local.tags
}