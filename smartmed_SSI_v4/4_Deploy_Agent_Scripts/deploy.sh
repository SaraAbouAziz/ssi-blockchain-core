#!/bin/bash

# =================================================
#  SMARTMED v4: CLOUD-NATIVE DEPLOYMENT SCRIPT
# =================================================

ENV_FILE=".env"

echo "================================================="
echo "1. INITIALIZING ENVIRONMENT AND SECURITY"
echo "================================================="

if [ ! -f "$ENV_FILE" ]; then
    echo "File $ENV_FILE not found. Generating secure cryptographic keys and API Keys..."

    cat <<EOF > $ENV_FILE
# Wallet Keys (Data at Rest Protection)
MINISTRY_WALLET_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
PROFESSIONAL_WALLET_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
GATEWAY_WALLET_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)

# Seed for VON Network Blockchain
MINISTRY_SEED=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)

# API Keys to protect Admin endpoints (Replacing insecure-mode)
MINISTRY_ADMIN_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
PROFESSIONAL_ADMIN_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
GATEWAY_ADMIN_KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
EOF
    echo ".env file created successfully!"
else
    echo "File $ENV_FILE found. Loading environment variables..."
fi

# Export variables to make them available to child scripts
set -a
source $ENV_FILE
set +a

echo ""
echo "================================================="
echo "2. CLEANING ENVIRONMENT (STOPPING OLD AGENTS)"
echo "================================================="
docker stop ministry_agent professional_agent gateway_agent 2>/dev/null || true
echo "Ports freed."

echo ""
echo "================================================="
echo "3. STARTING PRODUCTION AGENTS (DETACHED MODE)"
echo "================================================="
# Make scripts executable
chmod +x start_ministry.sh start_professional.sh start_gateway.sh

# Launch the 3 agents
./start_ministry.sh
./start_professional.sh
./start_gateway.sh

echo ""
echo "================================================="
echo "SMARTMED v4 ONLINE AND PROTECTED!"
echo "================================================="
echo "WARNING: Insomnia API calls now require authentication!"
echo "Use the API Key generated in the .env file to make requests."
echo "================================================="