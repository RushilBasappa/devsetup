variable "dependency" {
  type = list
}

variable "app_name" {
  type = string
}

variable "namespace" {
  type = string
}

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
