# vault-config

* `engines.tf` deploys the engines only (no credentials)
  * `engines/*.yml` describes secret engines
    * `path` in `engines/*.yml` should match the file's basename if possible
* `policies.tf` deploys the policies (stateless)
  * `policies/*.yml` describes policies

* `vault.hcl` is the vault config
