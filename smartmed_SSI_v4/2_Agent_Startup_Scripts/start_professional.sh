#!/bin/bash

# =================================================
#  STARTING AGENT: MEDICAL PROFESSIONAL (HOLDER)
# =================================================
# Network: von_von
# Inbound Port (DIDComm): 8030
# Admin API Port (Controller): http://localhost:8031
# =================================================
echo "Initializing ACA-Py cryptographic engine..."
echo "Logs will appear below. Press CTRL+C to terminate."
echo ""

docker run -it --rm \
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
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name ProfessionalWallet_SmartMed \
  --wallet-key ProfessionalSecretKey123 \
  --genesis-url http://webserver:8000/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-credential-offer \
  --auto-store-credential \
  --auto-respond-presentation-request \
  --log-level info