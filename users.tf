# https://github.com/hashicorp/terraform-provider-vault/issues/1015
# https://github.com/hashicorp/terraform-provider-vault/pull/1802

locals {
  users = { for f in flatten([for i in fileset("${path.module}/users/", "*.secret") : yamldecode(file("${path.module}/users/${i}"))]) : f.username => f }
}

resource "vault_generic_endpoint" "client_userpass" {
  for_each             = local.users
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/${each.key}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["default"],
  "password": "${each.value.password}"
}
EOT
}
