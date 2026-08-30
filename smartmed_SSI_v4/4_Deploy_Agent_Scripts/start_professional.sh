#!/bin/bash

echo "Starting Medical Professional (Holder) Agent - Production..."

docker run -d --rm \
  --name professional_agent \
  --network von_von \
  -p 8030:8030 \
  -p 8031:8031 \
  ghcr.io/openwallet-foundation/acapy-agent:latest start \
  --label "MedicalProfessional" \
  --inbound-transport http 0.0.0.0 8030 \
  --outbound-transport http \
  --endpoint http://professional_agent:8030 \
  --admin 0.0.0.0 8031 \
  --admin-api-key "$PROFESSIONAL_ADMIN_KEY" \
  --wallet-type askar \
  --wallet-name ProfessionalWallet_SmartMed \
  --wallet-key "$PROFESSIONAL_WALLET_KEY" \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --log-level info