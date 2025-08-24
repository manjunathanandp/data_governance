# ----------------------------
# 3. IAM Bindings for Policy Tags
# ----------------------------
# Assign user group to "Sensitive"
resource "google_data_catalog_policy_tag_iam_member" "sensitive_binding" {
  policy_tag = google_data_catalog_policy_tag.sensitive.name
  role       = "roles/datacatalog.categoryFineGrainedReader"
  member     = "group:data-analysts@example.com"
}

# Assign another group to "Restricted"
resource "google_data_catalog_policy_tag_iam_member" "restricted_binding" {
  policy_tag = google_data_catalog_policy_tag.restricted.name
  role       = "roles/datacatalog.categoryFineGrainedReader"
  member     = "group:data-admins@example.com"
}