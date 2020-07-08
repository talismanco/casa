####### Configuration for jq ###################################################
##                                                                            ##
## * Set default colors                                                       ##
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
  programs.jq = {
    enable = true;
    colors = mkDefault {
      null    = "1;30";
      false   = "0;31";
      true    = "0;32";
      numbers = "0;36";
      strings = "0;33";
      arrays  = "1;35";
      objects = "1;37";
    };
  };
}