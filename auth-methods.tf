variable "duo_api_hostname" {
  type = string
}

variable "duo_secret_key" {
  type = string
}

variable "duo_integration_key" {
  type = string
}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_identity_mfa_duo" "duo" {
  api_hostname    = var.duo_api_hostname
  secret_key      = var.duo_secret_key
  integration_key = var.duo_integration_key
  // TODO: figure out how to genericize the aliases
  username_format = "{{identity.entity.aliases.${vault_auth_backend.userpass.accessor}.name}}"
}

resource "vault_identity_mfa_login_enforcement" "userpass_duo" {
  name = "userpass_duo"
  mfa_method_ids = [
    vault_identity_mfa_duo.duo.method_id,
  ]
  auth_method_types = ["userpass"]
}
