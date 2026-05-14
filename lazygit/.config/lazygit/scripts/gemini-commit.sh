#!/bin/bash

set -e

GEMINI_API_KEY="${GEMINI_API_KEY}"

if [ -z "$GEMINI_API_KEY" ]; then
  echo "Error: GEMINI_API_KEY is not set" >&2
  exit 1
fi

# Get staged diff; fall back to full diff if nothing staged
DIFF=$(git diff --cached)
if [ -z "$DIFF" ]; then
  DIFF=$(git diff HEAD)
fi

if [ -z "$DIFF" ]; then
  echo "No changes to summarise" >&2
  exit 1
fi

# Truncate diff to avoid token limits
DIFF=$(echo "$DIFF" | head -c 8000)

PROMPT="Write a concise git commit message for the following diff. Use the conventional commits format (e.g. feat:, fix:, refactor:, docs:). Output only the commit message, nothing else.\n\nDiff:\n$DIFF"

RESPONSE=$(curl -s \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${GEMINI_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{
    \"contents\": [{
      \"parts\": [{\"text\": $(echo "$PROMPT" | jq -Rs .)}]
    }]
  }")

# Extract the message text
MESSAGE=$(echo "$RESPONSE" | jq -r '.candidates[0].content.parts[0].text // empty' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

if [ -z "$MESSAGE" ]; then
  echo "Error: No message returned. Response: $RESPONSE" >&2
  exit 1
fi

echo "$MESSAGE"
