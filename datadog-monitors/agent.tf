resource "datadog_monitor" "agent" {
  name    = "Host Not responding - {{host.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"datadog.agent.up\".over(\"*\").by(\"host\").last(2).count_by_status()"

  new_host_delay    = 300
  notify_no_data    = true
  no_data_timeframe = 10

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 1
  }

  tags = local.tags
}
