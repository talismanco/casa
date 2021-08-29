{ lib, pkgs, ... }:

let inherit (builtins) readFile;
in rec {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = readFile ./config/vimrc;
      plug.plugins = with pkgs.vimPlugins; [ ];
    };
  };
}
