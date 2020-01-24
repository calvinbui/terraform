resource "datadog_monitor" "docker-containers-stopped" {
  name    = "Docker Containers Not Running - {{host.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "min(last_30m):sum:docker.containers.stopped.total{*} by {host} > 0"

  thresholds = {
    critical = 0
  }

  no_data_timeframe = 0

  tags = local.tags
}

resource "datadog_monitor" "docker-service" {
  name    = "Docker Not Running - {{host.name}}"
  type    = "service check"
  message = var.notify_email

  query = "\"docker.service_up\".over(\"*\").by(\"host\").last(2).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 3
  }

  no_data_timeframe = 0

  tags = local.tags
}

resource "datadog_monitor" "docker-exit" {
  name    = "Docker Container Crashed - {{host.name}} - {{container_name.name}}"
  type    = "service check"
  message = var.notify_mattermost

  query = "\"docker.exit\".over(\"*\").by(\"container_name\",\"host\").last(6).count_by_status()"

  thresholds = {
    ok       = 1
    warning  = 1
    critical = 5
  }

  no_data_timeframe = 0

  tags = local.tags
}
