> And custom keyboard mapping which makes it possible to type parens
> without pressing Shift is complete idiocy, because you won't be able
> to work with anyone's machine.

—[yosefk](http://yosefk.com/blog/i-cant-believe-im-praising-tcl.html)

------------------------------------------------------------------------

Keyboard mappings for Linux using Xkb.

This repository contains keyboard layouts which are based on an ISO
(European) 105 key Qwerty layout, more specifically the Norwegian layout
(`no`). The two main layout variations are “programming” (meant for
writing English and programming) and “Norwegian” (meant for writing
Norwegian, not great for programming).

These layouts are Qwerty in the sense that no letters are changed
around. But the customizations are still quite drastic. The goal of
these layouts is not to make a new arrangement of letters that is better
optimized for speed or ergonomics of writing prose (based on alternating
hands, letter frequencies, etc.), like layouts like Dvorak and Colemaks
tries to do. Instead, the goal of these layouts could be contrasted by
describing them as customizing the *fringes* of the layouts, such as the
`Caps Lock` key and the numeric row. See `xkb-tree/symbols/twin-dexter`
for details.

# Software needed

The Xkb utilities `setxkbmap` and `xkbcomp` are needed for
`scripts/keyboard-setup`.

If you have the Nix package manager as well as the Nix shell, you can
run `nix-shell --pure` while in this directory in order to set up a
shell from which you can run the `scripts/keyboard-setup`.

# Layouts

There are two layouts:

- a main (base) layout for writing English and programming
  (`twin-dexter(pr)`); and
- a Norwegian variant (`twin-dexter(no)`) which simply maps the three
  Norwegian letters to the usual keys and maps the Norwegian quotemarks
  to what is the English double quotemarks on the main layout.

# Usage

The main layout is invoked as `twin-dexter(pr)`:

``` {.shell}
scripts/keyboard-setup "twin-dexter(pr)"
```

While the Norwegian variant is invoked as `twin-dexter(no)`:

``` {.shell}
scripts/keyboard-setup "twin-dexter(no)"
```

# Tools

The following are useful tools for working with Xkb and keyboard layouts
on Linux.

- `xkbcomp`: “compile a XKB keyboard description to a keymap suitable
  for loadkeys”. Use this when the mapping won’t compile and you want
  better error messages. Remember to use a relative path to the file if
  you want to try to compile a mapping in the current directory.
- `setxkbmap`: “set the keyboard using the X Keyboard Extension”.
- `man xkeyboard-config`: “XKB data description files”. Really useful to
  find ready-made options like “swap Ctrl and Caps Lock”.
- `xkbprint`: “print an XKB keyboard description”. Print a PostScript
  file of a keyboard mapping. The easiest way to use seems to be to
  print the current keyboard by using [an “X display
  specification”:](https://askubuntu.com/a/381393/136104) `xkbprint :0
  output.ps`. You should be able to open the PostScript file in a PDF
  viewer.
- `xkbset`: utility to set user preferences like “stickykeys” (“latch”
  in Xkb terminology), mousekeys, and so on. This might be a useful
  complement to `setxkbmap` since it seems that setting latch options
  is pretty limited with `setxkbmap`, at least according to `man
   xkeyboard-config`. ([Source](https://superuser.com/a/414535))
- `xkbwatch`: reports the changes to the Xkb states. This might be
  useful if you want some visual indication of things like the lock- or
  lach-state of the various shifts, for example.
- `gkbd-keyboard-display`: display a keyboard layout from the command
  line. Much more convenient than using `xkbprint` if you simply want to
  quickly find out what some standard layout looks like. Example usage:
  display the `us` layout with `gkbd-keyboard-display -l us`.
  ([Source](https://askubuntu.com/a/459997/136104).)

  Note: you might want to run `setxkbmap -option "" <layout>` before
  running this command in order to reset any options. I’ve run into some
  confusing behavior in which the mappings from the keyboard that I was
  currently using seemed to bleed into the visual description, although
  it had nothing to do with that layout. More concretely, I ran
  `gkbd-keyboard-display -l 'us(intl)'` which showed some mappings
  that are not supposed to be on that layout.
- Run `xset q` in order to see a lot information about the current
  state/settings. The most interesting part is probably the indicators
  which show the modifiers that are currently locked.
- `xmodmap -pm` prints the modifiers and what keys they are mapped to.
  For example:

  ``` {.shell}
  $ xmodmap -pm
  xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

  shift       Shift_L (0x32),  Shift_R (0x3e)
  lock
  control     Control_L (0x25),  Control_R (0x69)
  mod1        Alt_L (0x85),  Alt_R (0x87),  Meta_L (0xcd)
  mod2        Hyper_R (0x33),  Hyper_L (0x42),  Num_Lock (0x4d),  Hyper_L (0xcf)
  mod3        ISO_Level5_Shift (0xcb)
  mod4        Super_L (0x40),  Super_R (0x6c),  Super_L (0xce)
  mod5        ISO_Level3_Shift (0x5c)
  ```

# Files

- Keyboard mappings for the system is located in
  `/usr/share/X11/xkb/symbols`.
- Compose mappings for X: `/usr/share/X11/locale/en_US.UTF-8/Compose`.
- Keysymbol definitions are in: `/usr/include/X11/keysymdef.h`. There
  you can find what keys and symbols (characters) are named, for example
  `XK_Home` (home key) and `XK_ampersand` (`&`).

## Finding files on NixOS

The above listed files are not stored in the usual places on NixOS. You
can use a utility like Find to search for them in the `/nix/store/`
directory tree:

``` {.shell}
cd /nix/store
find -name 'keysymdef.h'
```

This should give you several results.

# License

The MIT license; see `LICENSE.md`.
