#!/usr/bin/env bash
set -e

GITHUB_ORG="ubcma"

REPOS=(mp-backend mp-frontend ma-site ma-network)

echo "Cloning UBCMA repositories into the current directory..."
echo ""

for repo in "${REPOS[@]}"; do
  if [ -d "$repo" ]; then
    echo "→ $repo already exists, skipping"
  else
    echo "→ Cloning $repo..."
    git clone "https://github.com/${GITHUB_ORG}/${repo}.git"
  fi
done

echo ""
echo "All repositories ready."
echo ""
echo "Next steps:"
echo "  1.  cp mp-backend/.env.example mp-backend/.env  (then fill in secrets)"
echo "  2.  cp mp-frontend/.env.example mp-frontend/.env  (then fill in secrets)"
echo "  3.  docker compose up"
echo ""
echo "Service URLs once running:"
echo "  mp-frontend  → http://localhost:3000"
echo "  mp-backend   → http://localhost:8080"
echo "  ma-site      → http://localhost:3001"
echo "  ma-network   → http://localhost:3002"
