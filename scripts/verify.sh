#!/usr/bin/env bash
# Health check for the whole toolchain. Prints OK/FAIL per item, exits 1 on any failure.
set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
ok()   { printf '  \033[32mOK\033[0m    %-22s %s\n' "$1" "$2"; }
bad()  { printf '  \033[31mFAIL\033[0m  %-22s %s\n' "$1" "$2"; fail=1; }
skip() { printf '  \033[33mSKIP\033[0m  %-22s %s\n' "$1" "$2"; }

ver() { # name, command
  local out
  if out=$(eval "$2" 2>&1 | head -1); then ok "$1" "$out"; else bad "$1" "$out"; fi
}

echo "== Tool versions"
ver "Node.js"     "node -v"
ver "npm"         "npm -v"
ver "Git"         "git --version"
ver "Python"      "python3 --version"
ver "TypeScript"  "npx --no-install tsc -v"
ver "SQLite"      "sqlite3 --version"
ver "GitHub CLI"  "gh --version"
ver "Claude Code" "claude --version"
if docker info >/dev/null 2>&1; then ok "Docker" "$(docker --version)"; else skip "Docker" "daemon not running"; fi

echo "== Project checks"
node -e "const [M]=process.versions.node.split('.');process.exit(M>=20?0:1)" \
  && ok "Node >= 20" "" || bad "Node >= 20" "too old"
[ -d node_modules ] && ok "npm install" "" || bad "npm install" "run: npm install"
npx --no-install tsc --noEmit >/dev/null 2>&1 && ok "TypeScript strict" "" || bad "TypeScript strict" "run: npm run typecheck"
npm run -s lint >/dev/null 2>&1 && ok "ESLint" "" || bad "ESLint" "run: npm run lint"
npm run -s test >/dev/null 2>&1 && ok "Tests (Vitest)" "" || bad "Tests (Vitest)" "run: npm test"
npm run -s build >/dev/null 2>&1 && ok "Next.js build" "" || bad "Next.js build" "run: npm run build"
sqlite3 :memory: "select 'sqlite ok';" >/dev/null 2>&1 && ok "SQLite query" "" || bad "SQLite query" ""
git rev-parse --is-inside-work-tree >/dev/null 2>&1 && ok "Git repo" "$(git branch --show-current)" || bad "Git repo" ""

echo "== Secrets"
if git ls-files | grep -E '(^|/)\.env($|\.)' | grep -v '\.env\.example$' >/dev/null; then
  bad ".env not committed" "an .env file is tracked by git!"
else ok ".env not committed" ""; fi
if [ -n "${ANTHROPIC_API_KEY:-}${CLAUDE_CODE_OAUTH_TOKEN:-}" ]; then ok "Claude auth secret" "set via Codespaces secret"
else skip "Claude auth secret" "none — sign in with 'claude' instead"; fi

echo
[ $fail -eq 0 ] && echo "All checks passed." || echo "Some checks failed — see above."
exit $fail
