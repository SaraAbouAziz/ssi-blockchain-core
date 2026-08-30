#!/bin/bash

# =================================================
#  STARTING AGENT: SMARTMED GATEWAY (VERIFIER)
# =================================================
# Network: von_von
# Inbound Port (DIDComm): 8040
# Admin API Port (Controller): http://localhost:8041
# =================================================
echo "Initializing ACA-Py cryptographic engine..."
echo "Logs will appear below. Press CTRL+C to terminate."
echo ""

docker run -it --rm \
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
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name GatewayWallet_SmartMed \
  --wallet-key GatewaySecretKey123 \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-presentation-proposal \
  --auto-verify-presentation \
  --log-level info