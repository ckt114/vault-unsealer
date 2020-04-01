# Vault Unsealer
Docker container that continuously check Vault's seal status and unseal it automaically.

# Run container from Docker registry
The container is available from the Docker registry and this is the simplest way to get it.
To run the container use this command:

```shell
$ docker run -d \
             -e VAULT_ADDR=http://localhost:8200 \
             -e VAULT_UNSEAL_TOKENS="key1 key2 keyN" \
             -e VAULT_SKIP_VERIFY=true \
             -e TIMEOUT=300 \
             tranchung/vault-unsealer
```

# Environment Variables
| Variable             | Required | Description                                 | Example                                |
|----------------------|----------|---------------------------------------------|----------------------------------------|
|`VAULT_ADDR`          | Yes      | Vault URL and port                          | `VAULT_ADDR=http://localhost:8200`     |
|`VAULT_UNSEAL_TOKENS` | Yes      | Space-separated unseal tokens               | `VAULT_UNSEAL_TOKENS="key1 key2 keyN"` |
|`VAULT_SKIP_VERIFY`   | No       | Skip TLS certificate check                  | `VAULT_SKIP_VERIFY=true`               |
|`TIMEOUT`             | No       | Timeout in seconds between check and unseal | `TIMEOUT=300`                          |
| OTHER                | No       | Any other variable from `vault get --help`  | `N/A`                                  |

