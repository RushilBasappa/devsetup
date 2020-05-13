resource "google_service_account" "service_account" {
  account_id   = "jenkins-registry"
  display_name = "Jenkins Container Registry"
  project      = var.project_id
}

resource "google_project_iam_member" "role-binding" {
  count   = length(var.iam_roles)
  project = var.project_id
  role    = var.iam_roles[count.index]
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service_account.email
}
