#!/usr/bin/env bash

BAR_ICON=""
LIST=$(trash-list)

if [ -z "$LIST" ]; then
  echo "$BAR_ICON"
else
  COUNT=$(echo "$LIST" | wc -l)
  echo "$BAR_ICON$COUNT"
fi

