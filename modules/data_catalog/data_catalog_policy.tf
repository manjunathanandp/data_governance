# 3. Masking rules defined in Data Catalog (governed layer)
resource "google_data_catalog_data_policy" "mask_phone_last4" {
  policy_id         = "mask_phone_last4"
  location          = var.region
  policy_tag        = google_data_catalog_policy_tag.sensitive.id
  data_policy_type  = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "LAST_FOUR_CHARACTERS"
  }
}

resource "google_data_catalog_data_policy" "mask_cc_hash" {
  policy_id         = "mask_email_username"
  location          = var.region
  policy_tag        = google_data_catalog_policy_tag.restricted.id
  data_policy_type  = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "HASH"
  }
}