resource "datadog_monitor" "disk-low" {
  name    = "Disk Space - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "min(last_5m):sum:system.disk.in_use{*} by {device,host} > 0.9"

  thresholds = {
    critical = 0.9
  }

  no_data_timeframe = 0

  tags = local.tags
}

resource "datadog_monitor" "disk-ro" {
  name    = "Disk Read Only - {{host.name}} - {{device.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"disk.read_write\".over(\"*\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 5
  }

  no_data_timeframe = 0

  tags = local.tags
}

resource "datadog_monitor" "inodes" {
  name    = "Inodes - {{host.name}} - {{device.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "min(last_5m):avg:system.fs.inodes.in_use{*} by {device,host} > 90"

  thresholds = {
    critical = 90
  }

  no_data_timeframe = 0

  tags = local.tags
}
