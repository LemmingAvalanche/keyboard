#!/bin/sh

# Trash compiled keymaps, which will force a recompile. In turn we avoid having
# to deal with what are effectively "stale caches" of the the keymaps.
sudo trash-put /var/lib/xkb/*

sudo cp ~/.xkb/no_pr /usr/share/X11/xkb/symbols/no_pr
sudo cp ~/.xkb/no /usr/share/X11/xkb/symbols/no

sudo restart lightdm
