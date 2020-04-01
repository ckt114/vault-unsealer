#!/bin/bash

log() {
  if [[ "$2" == "error" ]]; then
    echo `date` - ERROR - $1
    exit 1
  else
    echo `date` - INFO - $1
  fi
}

if [[ -z "$VAULT_ADDR" || -z "$VAULT_UNSEAL_TOKENS" ]]; then
  log "Environment variables VAULT_ADDR and VAULT_UNSEAL_TOKENS are required" "error"
fi

if [[ -z "$TIMEOUT" ]]; then
  TIMEOUT=300
fi

log VAULT_ADDR=$VAULT_ADDR
log TIMEOUT=$TIMEOUT

while true
do
  log "Sleeping for $TIMEOUT seconds"
  seal_status=`vault status|grep -i sealed|awk '{print $2}'`
  if [[ $seal_status == 'true' ]]; then
    log "Unsealing vault at $VAULT_ADDR"
    tokens=($VAULT_UNSEAL_TOKENS)
    for token in "${tokens[@]}"; do
      vault operator unseal $token
    done
    exit_code=$?
    if [[ $exit_code -gt 0 ]]; then
      exit $exit_code
    else
      log "Successfully unseal vault at $VAULT_ADDR"
    fi
  else
    log "Vault is unsealed"
  fi
  sleep "$TIMEOUT"
done
