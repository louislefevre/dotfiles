#!/usr/bin/env bash

LIST=$(trash-list 2> /dev/null)

if [ -z "$LIST" ]; then
  COUNT=0
else
  COUNT=$(echo "$LIST" | wc -l)
fi

echo "$COUNT"
