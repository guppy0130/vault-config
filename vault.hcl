ui = true

storage "raft" {
  path    = "/data/vault"
  node_id = "inthemainfra.me"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = "true" # localhost only, rely on revproxy for tls-termination
}


api_addr = "http://127.0.0.1:8200"
cluster_addr = "http://127.0.0.1:8201"
