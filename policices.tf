# read in files from ./policies/*.yml, where key is basename no extension, and
# value is the contents of the HCL
resource "vault_policy" "policies" {
  for_each = { for f in fileset("${path.module}/policies/", "*.hcl") : trimsuffix(f, ".hcl") => file("${path.module}/policies/${f}") }

  name   = each.key
  policy = each.value
}
