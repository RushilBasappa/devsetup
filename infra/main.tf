module "dev" {
  source = "./environments/dev"

  secret_file_path = "secrets/dev_account.json"
}
