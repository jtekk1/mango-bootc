#!/usr/bin/env bash
set -euo pipefail

[[ -x /usr/local/bin/spf ]] && exit 0

case "$(uname -m)" in
  x86_64) arch=amd64 ;;
  aarch64) arch=arm64 ;;
  *) echo "Unsupported arch: $(uname -m)" >&2; exit 1 ;;
esac

tag=$(curl -fsSL https://api.github.com/repos/yorukot/superfile/releases/latest \
  | grep '"tag_name"' | head -1 | cut -d'"' -f4)

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

archive="superfile-linux-${tag}-${arch}.tar.gz"
curl -fsSL "https://github.com/yorukot/superfile/releases/download/${tag}/${archive}" \
  -o "$tmp/spf.tar.gz"
tar -xzf "$tmp/spf.tar.gz" -C "$tmp"

binary=$(find "$tmp" -name spf -type f -executable | head -1)
[[ -n "$binary" ]] || { echo "spf binary not found in tarball" >&2; exit 1; }

install -m 755 "$binary" /usr/local/bin/spf
