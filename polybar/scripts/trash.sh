#!/usr/bin/env bash

BAR_ICON="󰆴"
LIST=$(trash-list 2> /dev/null)

if [ -z "$LIST" ]; then
  COUNT=0
else
  COUNT=$(echo "$LIST" | wc -l)
fi

echo "$BAR_ICON$COUNT"
