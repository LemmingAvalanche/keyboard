#!/bin/sh

# Trash compiled keymaps, which will force a recompile. In turn we avoid having
# to deal with what are effectively "stale caches" of the the keymaps.
sudo trash-put /var/lib/xkb/*

sudo cp ~/.xkb/no_p1 /usr/share/X11/xkb/symbols/no_p1
sudo cp ~/.xkb/no_1 /usr/share/X11/xkb/symbols/no_1
sudo cp ~/.xkb/latin_p1 /usr/share/X11/xkb/symbols/latin_p1

sudo restart lightdm
