#!/usr/bin/env bash
set -euo pipefail
# Optional: pick a default theme (remove if you prefer to choose at runtime)

plymouth-set-default-theme spinner

# Rebuild initramfs for every kernel in the image so plymouth is actually loaded
dracut -f --regenerate-all

The dracut conf file (files/system/etc/dracut.conf.d/plymouth.conf) just needs the one line:
add_dracutmodules+=" plymouth "

