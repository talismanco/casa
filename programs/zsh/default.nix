####### Configuration for Zsh ##################################################
##                                                                            ##
## * No beeps                                                                 ##
## * Prompt like `[user@host.domain]:/path %` in green, and red for root      ##
## * 10 000 lines history in `~/.zsh_history` without immediate duplicates    ##
## * Correct UTF-8 handling on macOS                                          ##
##                                                                            ##
################################################################################

{ lib, pkgs, ... }:

let
  inherit (builtins) readFile;
  inherit (lib) mkDefault mkForce optionalString;
  inherit (pkgs) stdenv;

  config = import "../..";
in
{
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
