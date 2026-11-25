#!/usr/bin/env bash
# Runs once when the codespace is created. Safe to re-run.
set -euo pipefail

echo "==> Installing SQLite and Python 3"
sudo apt-get update -qq
sudo apt-get install -y -qq sqlite3 python3 python3-pip python3-venv >/dev/null

echo "==> Fix ownership of Claude Code config volume"
sudo mkdir -p "${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
sudo chown -R "$(id -u):$(id -g)" "${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

echo "==> Git defaults"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true
git config --global core.autocrlf input

echo "==> Shell aliases"
if ! grep -q "# ipad-dev aliases" ~/.bashrc; then
  cat >> ~/.bashrc <<'EOF'

# ipad-dev aliases
alias dev='npm run dev'
alias check='npm run check'
alias gs='git status -sb'
alias gl='git log --oneline --graph -15'
alias cc='claude'
EOF
fi

echo "==> Installing npm dependencies"
if [ -f package-lock.json ]; then npm ci; else npm install; fi

echo "==> Done. Run: bash scripts/verify.sh"
