#!/usr/bin/env bash
set -e

echo "Testing GitHub SSH connection..."
ssh -T -o StrictHostKeyChecking=no git@github.com 2>&1 | grep -q "successfully authenticated" && AUTH=1 || AUTH=0

if [ "$AUTH" -eq 1 ]; then
  echo "GitHub authenticated successfully!"
  git push -u origin main
  echo "Pushed successfully to GitHub!"
else
  echo "SSH key not recognized yet by GitHub."
  echo "Please make sure your SSH public key is added to: https://github.com/settings/ssh/new"
  echo "Key is already copied to your clipboard:"
  cat ~/.ssh/id_ed25519.pub
fi
