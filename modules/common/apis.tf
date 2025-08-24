resource "google_project_service" "apis" {
  for_each = toset([
    "datacatalog.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerydatapolicy.googleapis.com"
  ])
  project = var.project_id
  service = each.key
}
