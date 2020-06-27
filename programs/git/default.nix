####### Configuration for Git ##################################################
##                                                                            ##
## * Sign by default, using `gpg2` (including gitflow)                        ##
## * Default user credentials and gpg key                                     ##
## * Always create a merge commit by default (including gitflow)              ##
## * Rebase on pull, preserving previous merge commits                        ##
##                                                                            ##
################################################################################

{ config, lib, pkgs, ... }:

let
  inherit (lib) mkDefault;
in

{
  programs.git = {
    enable = mkDefault true;

    userName = mkDefault "Sam Craig";
    userEmail = mkDefault  "contact@samcraig.io";

    signing = {
      gpgPath = mkDefault "gpg2";
      signByDefault = mkDefault false;
      key = mkDefault "";
    };
  };
}
