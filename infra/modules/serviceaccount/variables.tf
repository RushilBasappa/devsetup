variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "iam_roles" {
  type = list
  default = [
    "roles/storage.admin",
    "roles/storage.objectAdmin",
    "roles/container.developer"
  ]
}
