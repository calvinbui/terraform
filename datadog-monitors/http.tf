resource "datadog_monitor" "http-connect" {
  name    = "HTTP Connection to {{url.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "max(last_30m):avg:network.http.can_connect{*} by {url} < 1"

  thresholds = {
    critical = 1
  }

  tags = local.tags
}

resource "datadog_monitor" "http-cert" {
  name    = "SSL Cert Expiry {{url.name}}"
  type    = "metric alert"
  message = var.notify_email

  query = "max(last_1d):avg:http.ssl.days_left{*} by {url} < 14"

  thresholds = {
    critical          = 14
    critical_recovery = 1
  }

  tags = local.tags
}
