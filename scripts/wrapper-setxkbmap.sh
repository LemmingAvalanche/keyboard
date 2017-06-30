#!/bin/sh

# Set keyboard to the argument, where the argument is one of the
# mappings in the file.
setxkbmap "twin-dexter($1)" -compat my-complete -print | xkbcomp -I"xkb-tree" - "$DISPLAY"
