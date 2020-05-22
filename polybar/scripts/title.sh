#!/usr/bin/env bash

ACTIVE=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS 2> /dev/null)
echo $ACTIVE | sed -e 's/.*"\(.*\)".*/\1/'

