resource "datadog_monitor" "mysql-connect" {
  name    = "MySQL - {{server.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"mysql.can_connect\".over(\"*\").by(\"server\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 5
  }

  no_data_timeframe = 0

  tags = local.tags
}
