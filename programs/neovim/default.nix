####### Configuration for Neovim ##################################################
##                                                                               ##
## * Enable `vi` & `vim` aliases                                                 ##
##                                                                               ##
###################################################################################

{ config, lib, pkgs, ... }:

let
  inherit (builtins) readFile;
  inherit (lib) mkDefault;

  plugins = pkgs.vimPlugins // pkgs.callPackage ./plugins.nix {};
in {
  programs.neovim = {
    enable = true;
    viAlias = mkDefault true;
    vimAlias = mkDefault true;
    configure = {
      customRC = readFile ./config/vimrc;
      plug.plugins = with plugins; [];
    };
  };
}