# Masked persona → sees masked values when policy tags are present
resource "google_project_iam_member" "masked_reader" {
  project = var.project_id
  role    = "roles/bigquerydatapolicy.maskedReader"
  member  = "group:${var.group_masked}"
}

# PHONE: show last 4 characters
resource "google_bigquery_datapolicy_data_policy" "mask_phone_number_last4" {
  provider         = google-beta
  project          = var.project_id
  location         = var.region
  data_policy_id   = "mask_phone_last4"
  data_policy_type = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "LAST_FOUR_CHARACTERS"
  }
  policy_tag = google_data_catalog_policy_tag.sensitive.name
}

# EMAIL: mask username (XXXXX@domain)
resource "google_bigquery_datapolicy_data_policy" "mask_email_username" {
  provider         = google-beta
  project          = var.project_id
  location         = var.region
  data_policy_id   = "mask_email_username"
  data_policy_type = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "EMAIL_MASK"
  }
  policy_tag = google_data_catalog_policy_tag.restricted.name
}
