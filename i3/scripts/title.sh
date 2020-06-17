#!/usr/bin/env bash

# Gets currently selected window, and retrieves its WM_CLASS attribute
class=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS 2> /dev/null)

# Takes the second string from the attribute, which contains the window name
window=$(echo $class | awk '{print $4}')

# Strips the opening and close quotations from the string
window="${window%\"}"
window="${window#\"}"

# Output the (quoteless) window name with the first letter as uppercase
echo "${window^}"

