#!/usr/bin/env bash
# Imperatives Setup-Skript aus Event 10 (Referenz für Sprint 4)
# Nachteil: Nicht idempotent, kein State-Tracking, kein Drift-Schutz.

set -euo pipefail

RG="rg-infte-g1"
LOC="switzerlandnorth"
ACR="acrinfteg1001"
LAW="law-infte-g1"
ENV="cae-infte-g1"

az group create --name "$RG" --location "$LOC"

az acr create \
  --resource-group "$RG" \
  --name "$ACR" \
  --sku Basic \
  --admin-enabled true

az monitor log-analytics workspace create \
  --resource-group "$RG" \
  --workspace-name "$LAW" \
  --location "$LOC"

az containerapp env create \
  --name "$ENV" \
  --resource-group "$RG" \
  --location "$LOC"
