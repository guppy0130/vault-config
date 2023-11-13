path "antioch/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "kubernetes/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "chicago/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "digitalocean/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "oracle/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "rclone-google-drive/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policies/acl" {
  capabilities = ["list"]
}

path "sys/policies/acl/*" {
  capabilities = ["list", "read"]
}

path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts" {
  capabilities = ["read", "list"]
}

path "sys/tools/*" {
  capabilities = ["read", "list", "update"]
}
