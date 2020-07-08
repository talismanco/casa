####### Configuration for Zsh ##################################################
##                                                                            ##
## * Setup `ZSH_DOTDIR` at `~/.config/zsh`                                    ##
##                                                                            ##
################################################################################

{ lib
, pkgs
, ... }:

let
  inherit (builtins) 
    readFile
  ;
  inherit (lib) 
    mkDefault 
    mkForce 
    optionalString
  ;
  inherit (pkgs) 
    stdenv
  ;
in
rec {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtraBeforeCompInit  = 
      mkForce (
        ''
        if [ -z "$IN_NIX_SHELL" ]; then
            source ${pkgs.antigen}/share/antigen/antigen.zsh
            source $HOME/.nix-profile/etc/profile.d/nix.sh
            export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
        fi
        '' +
        readFile ./bin/init.zsh
      );
  };

}
