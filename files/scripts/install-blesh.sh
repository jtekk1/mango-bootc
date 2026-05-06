#!/usr/bin/env bash
set -euo pipefail

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

git clone --recursive --depth 1 --shallow-submodules \
  https://github.com/akinomyoga/ble.sh.git "$TMP/blesh"

make -C "$TMP/blesh" install PREFIX=/usr
