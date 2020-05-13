output "service_account_email" {
  value = google_service_account.service_account.email
}

output "service_account_json_key" {
  value = base64decode(google_service_account_key.key.private_key)
}

output "status" {
  value = "done"
}
