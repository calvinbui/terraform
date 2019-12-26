resource "datadog_monitor" "docker-containers-stopped" {
  name    = "Docker Containers Not Running - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "min(last_30m):sum:docker.containers.stopped.total{*} by {host} > 0"

  thresholds = {
    critical = 0
  }

  tags = local.tags
}
