####### Configuration for Git ##################################################
##                                                                            ##
## * Set default user email & password                                        ##
## * Sign by default, using `gpg2` (including gitflow)                        ##
##                                                                            ##
################################################################################

{ config
, lib
, pkgs
, ... }:

let
  inherit (lib) 
    mkDefault
  ;
in
rec {
  programs.git = {
    enable = true;

    userName = mkDefault "Sam Craig";
    userEmail = mkDefault  "contact@samcraig.io";

    signing = {
      gpgPath = mkDefault "gpg2";
      signByDefault = mkDefault false;
      key = mkDefault "";
    };
  };
}
