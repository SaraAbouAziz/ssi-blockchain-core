#!/bin/bash
source aries_env/bin/activate

aca-py start \
  --label "SmartMedGateway" \
  --inbound-transport http 0.0.0.0 8040 \
  --outbound-transport http \
  --endpoint http://localhost:8040 \
  --admin 0.0.0.0 8041 \
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name GatewayWallet_SmartMed \
  --wallet-key GatewaySecretKey123 \
  --genesis-url http://test.bcovrin.vonx.io/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-presentation-proposal \
  --auto-verify-presentation