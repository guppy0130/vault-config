# Needed for the Terraform Vault Provider
path "auth/token/create" {
  capabilities = ["create", "read", "update", "list"]
}

# terraform needs to read chicago secrets to configure chicago infra
path "chicago/*" {
  capabilities = ["read", "list"]
}
