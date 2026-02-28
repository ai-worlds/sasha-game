#!/bin/bash
# Stamp version into arithmetyx.html before commit
cd "$(dirname "$0")"
DATE=$(date '+%b %d, %Y %I:%M %p')
# Get the short hash of what will be committed (use tree hash as proxy)
HASH=$(git rev-parse --short HEAD 2>/dev/null || echo "dev")
VERSION="v${HASH} · ${DATE}"
sed -i "s|<!-- AUTOVER -->.*<!-- /AUTOVER -->|<!-- AUTOVER -->${VERSION}<!-- /AUTOVER -->|" arithmetyx.html
sed -i "s|><!-- AUTOVER -->|><!-- AUTOVER -->${VERSION}<!-- /AUTOVER -->|" arithmetyx.html
