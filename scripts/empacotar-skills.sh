#!/usr/bin/env bash
# Gera um .zip por skill em dist/ para upload em claude.ai (Configurações › Capacidades › Skills).
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for dir in skills/*/; do
  name=$(basename "$dir")
  (cd skills && zip -qr "../dist/${name}.zip" "$name" -x '*/evals/*')
done
echo "Pacotes gerados em dist/:"; ls dist
