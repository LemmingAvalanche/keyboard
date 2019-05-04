# Run `nix-shell --pure` in the current directory to get access to the
# packages that you need to run `scripts/keyboard-setup`.
let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in rec {
  environment = stdenv.mkDerivation rec {
    name = "keyboard-environment";
    version = "1";
    src = ./.;
    buildInputs = [
      pkgs.xorg.xkeyboardconfig
      pkgs.xorg.setxkbmap
      pkgs.xorg.xkbcomp
    ];
  };
}
