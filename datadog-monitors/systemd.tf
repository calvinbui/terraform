resource "datadog_monitor" "systemd-unit" {
  name    = "SystemD Service - {{unit.name}}"
  type    = "service check"
  message = var.notify_mattermost

  query = "\"systemd.unit.state\".over(\"*\").by(\"unit\").last(2).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 1
  }

  no_data_timeframe = 0

  tags = local.tags
}
