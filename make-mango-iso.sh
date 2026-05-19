#!/bin/bash

sudo $(which bluebuild) generate-iso \
  --variant server \
  --tempdir /var/tmp \
  --iso-name nelhua-linux-mango.iso \
  image ghcr.io/jtekk1/nelhua-mango:latest
