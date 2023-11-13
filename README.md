# vault-config

* `engines/*.yml` describes secret engines
  * `engines.tf` deploys the engines only (no credentials)
* `policies/*.yml` describes policies
  * `policies.tf` deploys the policies (stateless)

* `vault.hcl` is the vault config
