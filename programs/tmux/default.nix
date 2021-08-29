{ lib, pkgs, ... }:

rec {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
  };
}
