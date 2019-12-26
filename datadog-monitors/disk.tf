resource "datadog_monitor" "disk-low" {
  name    = "Disk Space - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "sum(last_5m):sum:system.disk.in_use{!device:shm,!device:tmpfs,!device:overlay} by {device,host} > 0.9"

  thresholds = {
    critical = 0.9
  }

  tags = local.tags
}
