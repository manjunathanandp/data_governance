# ----------------------------
# 1. Create Taxonomy in Data Catalog
# ----------------------------

resource "google_data_catalog_taxonomy" "sensitivity" {
  provider               = google-beta
  project                = var.project_id
  region                 = var.region
  display_name           = "Sensitivity"
  description            = "Column security & masking policy tags"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
  depends_on             = [google_project_service.apis]
}

resource "google_data_catalog_taxonomy" "pii_taxonomy" {
  display_name = "PII Classification"
  description  = "Taxonomy for PII data governance"
  region       = var.region
}

# ----------------------------
# 2. Create Policy Tags
# ----------------------------
resource "google_data_catalog_policy_tag" "sensitive" {
  taxonomy     = google_data_catalog_taxonomy.pii_taxonomy.id
  display_name = "Sensitive"
  description  = "Highly sensitive PII (e.g. SSN, Credit Card)"
}

resource "google_data_catalog_policy_tag" "restricted" {
  taxonomy     = google_data_catalog_taxonomy.pii_taxonomy.id
  display_name = "Restricted"
  description  = "Restricted data (e.g. emails, phone numbers)"
}