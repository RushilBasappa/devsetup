terraform {
  required_version = ">= 0.12.24"
}

module "dev" {
  source = "./environments/dev"

  secret_file_path = "secrets/dev_account.json"
  cluster_name     = "microservices"
  project_id       = "groovy-student-275113"
  region           = "us-central1"
  zone             = "us-central1-c"
}

output "dev_setup" {
  value = module.dev
}
