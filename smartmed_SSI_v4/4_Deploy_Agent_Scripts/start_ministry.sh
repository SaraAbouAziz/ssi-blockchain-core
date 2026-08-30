#!/bin/bash

echo "Starting Ministry of Health (Issuer) Agent - Production..."

docker run -d --rm \
  --name ministry_agent \
  --network von_von \
  -p 8020:8020 \
  -p 8021:8021 \
  ghcr.io/openwallet-foundation/acapy-agent:latest start \
  --label "MinistryOfHealth" \
  --inbound-transport http 0.0.0.0 8020 \
  --outbound-transport http \
  --endpoint http://ministry_agent:8020 \
  --admin 0.0.0.0 8021 \
  --admin-api-key "$MINISTRY_ADMIN_KEY" \
  --wallet-type askar \
  --wallet-name MinistryWallet_SmartMed \
  --wallet-key "$MINISTRY_WALLET_KEY" \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --seed "$MINISTRY_SEED" \
  --log-level info