#!/usr/bin/env bash
set -e
echo "[INFO] Running Enterprise Stack Health Check..."

# Check directory structure
for dir in terraform ansible scripts; do
  if [ -d "$dir" ]; then
    echo "[OK] Directory '$dir' exists."
  else
    echo "[ERROR] Missing directory '$dir'!"
    exit 1
  fi
done

echo "[SUCCESS] All critical enterprise stack components verified."
