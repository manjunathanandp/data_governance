resource "google_bigquery_dataset" "myorg" {
  dataset_id                 = "myorg"
  location                   = var.region
  delete_contents_on_destroy = true
}

# ----------------------------
# 4. Attach Policy Tag to BigQuery Column
# ----------------------------
resource "google_bigquery_table" "customers" {
  dataset_id = google_bigquery_dataset.myorg.dataset_id
  table_id   = "customers"

  schema = jsonencode([
    {
      name = "customer_id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "phone_number"
      type = "STRING"
      mode = "NULLABLE"
      policyTags = {
        names = [google_data_catalog_policy_tag.restricted.name]
      }
    },
    {
      name = "ssn"
      type = "STRING"
      mode = "NULLABLE"
      policyTags = {
        names = [google_data_catalog_policy_tag.sensitive.name]
      }
    }
  ])
}

