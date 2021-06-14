resource "local_file" "istio_dashboards" {
  filename = "scripts/import-all-istio-dashboards.sh"
  content = templatefile(
    "${path.module}/templates/import-all-istio-dashboards.sh.hcl",
    {
      GRAFANA_CRED = local.grafana_auth
      GRAFANA_HOST = local.grafana_url
    }
  )
}