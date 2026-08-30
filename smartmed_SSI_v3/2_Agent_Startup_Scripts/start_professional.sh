#!/bin/bash
source aries_env/bin/activate

aca-py start \
  --label "MedicalProfessional" \
  --inbound-transport http 0.0.0.0 8030 \
  --outbound-transport http \
  --endpoint http://localhost:8030 \
  --admin 0.0.0.0 8031 \
  --admin-insecure-mode \
  --wallet-type askar \
  --wallet-name ProfessionalWallet_SmartMed \
  --wallet-key ProfessionalSecretKey123 \
  --genesis-url http://test.bcovrin.vonx.io/genesis \
  --auto-provision \
  --auto-accept-invites \
  --auto-accept-requests \
  --auto-respond-credential-offer \
  --auto-store-credential \
  --auto-respond-presentation-request