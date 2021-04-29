####### Configuration for jq ###################################################
##                                                                            ##
## * Enable ZSH shell hook                                                    ##
##                                                                            ##
################################################################################

{ pkgs
, lib
, ... }:

let
  inherit (lib)
    mkDefault
  ;
in
rec {
  programs.keychain = {
    enable = true;
    enableZshIntegration = mkDefault true;
  };
}