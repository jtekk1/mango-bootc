#!/usr/bin/env bash
set -euo pipefail

plymouth-set-default-theme spinner
dracut -f --regenerate-all
