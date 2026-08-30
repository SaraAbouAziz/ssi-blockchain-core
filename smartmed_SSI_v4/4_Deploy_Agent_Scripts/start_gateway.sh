#!/bin/bash

echo "Starting SmartMed Gateway (Verifier) Agent - Production..."

docker run -d --rm \
  --name gateway_agent \
  --network von_von \
  -p 8040:8040 \
  -p 8041:8041 \
  ghcr.io/openwallet-foundation/acapy-agent:latest start \
  --label "SmartMedGateway" \
  --inbound-transport http 0.0.0.0 8040 \
  --outbound-transport http \
  --endpoint http://gateway_agent:8040 \
  --admin 0.0.0.0 8041 \
  --admin-api-key "$GATEWAY_ADMIN_KEY" \
  --wallet-type askar \
  --wallet-name GatewayWallet_SmartMed \
  --wallet-key "$GATEWAY_WALLET_KEY" \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --log-level info