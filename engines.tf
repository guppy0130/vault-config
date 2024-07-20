# read in files from ./engines/*.yml, where key is basename no extension, and
# value is the contents of the YAML config
locals {
  engines = { for f in flatten([for i in fileset("${path.module}/engines/", "*.yml") : yamldecode(file("${path.module}/engines/${i}"))]) : f.path => f }
}

# you may need to manually destructure/map keys for different engines
resource "vault_mount" "engines" {
  for_each = local.engines

  path    = each.key
  type    = each.value.type
  options = each.value.options
}
