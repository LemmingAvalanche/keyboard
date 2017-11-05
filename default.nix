# Run `nix-shell --pure` in the current directory to get access to the
# packages that you need to run `scripts/keyboard-setup`.
let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  # Override `src` in order to fetch the source for Xbkcomp 1.3.1 since
  # Xkbcomp does not work as I want.
  xkbcomp = pkgs.xorg.xkbcomp.overrideAttrs (oldAttrs: rec {
     src = pkgs.fetchurl {
        url = "http://xorg.freedesktop.org/archive/individual/app/xkbcomp-1.3.1.tar.bz2";
        sha256 = "0gcjy70ppmcl610z8gxc7sydsx93f8cm8pggm4qhihaa1ngdq103";
     };
  });
in rec {
  environment = stdenv.mkDerivation rec {
    name = "keyboard-environment";
    version = "1";
    src = ./.;
    buildInputs = [
      pkgs.xorg.xkeyboardconfig
      pkgs.xorg.setxkbmap
      xkbcomp
    ];
  };
}
