resource "datadog_monitor" "systemd-unit" {
  name    = "SystemD Service - {{unit.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"systemd.unit.state\".over(\"*\").by(\"unit\").last(2).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 1
  }

  tags = local.tags
}
