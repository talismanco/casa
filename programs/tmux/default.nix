####### Configuration for Tmux ####################################################
##                                                                               ##
## * Enable vim as default keymode                                               ##
##                                                                               ##
###################################################################################

{ config
, lib
, pkgs
, ... }:

let
  config = import ../..;
in 
rec {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
  };
}