#!/bin/bash
source aries_env/bin/activate

aca-py start \
  --label "MinistryOfHealth" \
  --inbound-transport http 0.0.0.0 8020 \
  --outbound-transport http \
  --endpoint http://localhost:8020 \
  --admin 0.0.0.0 8021 \
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name MinistryWallet_SmartMed \
  --wallet-key MinistrySecretKey123 \
  --genesis-url http://test.bcovrin.vonx.io/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-credential-proposal \
  --auto-respond-credential-request