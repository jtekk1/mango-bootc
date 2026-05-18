#!/usr/bin/env bash
set -euo pipefail

plymouth-set-default-theme solar
dracut -f --regenerate-all
