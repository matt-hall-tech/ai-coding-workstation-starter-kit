#!/usr/bin/env bash
set -euo pipefail

# Minimal starter scaffold for rebuilding the workshop baseline.
# Edit paths and commands to match your machine.

WORKSPACE_ROOT="${1:-$HOME/LLM-Workshop}"

echo "[1/6] Creating workspace folders under: $WORKSPACE_ROOT"
mkdir -p "$WORKSPACE_ROOT"/{repo,work-rw,drop-ro,logs,data,secrets,backups}

# Optional folders
mkdir -p "$WORKSPACE_ROOT"/{models,compose}

echo "[2/6] Verifying core tools"
command -v git >/dev/null || { echo "git not found"; exit 1; }
command -v python3 >/dev/null || { echo "python3 not found"; exit 1; }

echo "[3/6] Preparing repo folder"
if [ ! -d "$WORKSPACE_ROOT/repo/.git" ]; then
  echo "Clone your repo into: $WORKSPACE_ROOT/repo"
fi

echo "[4/6] Python environment reminder"
echo "Create project-local .venv only where Python is needed"

echo "[5/6] Secrets reminder"
echo "Store live provider secrets in: $WORKSPACE_ROOT/secrets"
echo "Keep .env.example in repo; do not commit live .env files"

echo "[6/6] Next step reminder"
echo "Run one post-build cloud API test before adding Docker or local models"
