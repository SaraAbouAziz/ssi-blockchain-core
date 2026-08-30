#!/bin/bash

# =================================================
#  STARTING AGENT: MINISTRY OF HEALTH (ISSUER)
# =================================================
# Network: von_von
# Inbound Port (DIDComm): 8020
# Admin API Port (Controller): http://localhost:8021
# =================================================
echo "Initializing ACA-Py cryptographic engine..."
echo "Logs will appear below. Press CTRL+C to terminate."
echo ""

docker run -it --rm \
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
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name MinistryWallet_SmartMed \
  --wallet-key MinistrySecretKey123 \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-credential-proposal \
  --auto-respond-credential-request \
  --seed 00000000000000000000000Ministry1 \
  --log-level info