################################################################################
##                                                                            ##
##                   Home configuration for user@linux                        ##
##                                                                            ##
################################################################################

{ config
, lib
, pkgs
, ... }:

let
  config = import ../..;
in
rec {
  imports = [ ../common/home.nix ];

  # Linux specific packages.
  home.packages = with pkgs; [
    # <nixpkgs>
    # ...
    # <talismanpkgs>
    # ...
  ];

  ############################################################################
  ##                          Program Overrides                             ##
  ############################################################################

  programs.git = {
    extraConfig.credential.helper = "store";
  };
}
