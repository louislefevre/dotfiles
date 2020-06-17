#!/usr/bin/env bash

# Retrieve the list of items within the trash
list=$(trash-list 2> /dev/null)

# If the list is empty, count is 0. If not, count is equal to the amount of lines within the list
# Setting count to 0 manually is necessary as for some reason, the line counter is always minimum 1
if [ -z "$list" ]; then
  count=0
else
  count=$(echo "$list" | wc -l)
fi

# Output the trash counter
echo "$count"
