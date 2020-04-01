# vault-unsealer Helm Chart

This directory contains a Kubernetes chart to deploy vault-unsealer, a utility to automatically unseal Vault.

## Prerequisites Details

* Kubernetes 1.6+

## Chart Details

This chart will do the following:

* Implement a vault-unsealer deployment

## Installing the Chart
```console
$ helm repo add trankchung https://trankchung.github.io/charts/
$ helm repo update
$ helm install --name vault-unsealer trankchung/vault-unsealer
```

## Configuration

The following table lists the configurable parameters for the `vault-unsealer` chart and their default values.

|             Parameter                   |              Description                  |               Default               |
|-----------------------------------------|-------------------------------------------|-------------------------------------|
| `image.registry`                        | Container registry                        | `docker.io`                         |
| `image.repository`                      | Container image to use                    | `tranchung/vault-unsealer`          |
| `image.tag`                             | Container image tag to deploy             | `latest`                            |
| `image.pullPolicy`                      | Container pull policy                     | `IfNotPresent`                      |
| `vaultAddr`                             | Full URL with port to Vault               | `http://localhost:8200`             |
| `unsealTokens`                          | Space-separated list of unseal tokens     | `key1 key2 keyN`                    |
| `skipTlsVerify`                         | Skip TLS certificate error                | `false`                             |
| `timeout`                               | Timeout in seconds to retry unsealing     | `300`                               |
| `extraEnvVars`                          | Additional env variables for deployment   | `{}`                                |
| `strategy`                              | Pod upgrade strategy                      | `{}`                                |
| `securityContext`                       | Pod security context                      | `{}`                                |
| `resources`                             | Pod resource requests/limts               | `{}`                                |
| `nodeSelector`                          | Pod node selector                         | `{}`                                |
| `affinity`                              | Pod affinity                              | `{}`                                |

