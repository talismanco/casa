################################################################################
##                                                                            ##
##                   Home configuration for user@linux                        ##
##                                                                            ##
################################################################################

{ config, lib, pkgs, ... }:

let
  config = import ../..;
in

{
  imports = [ ../common/home.nix ];

  # Linux specific packages.
  home.packages = with pkgs; [
    # <nixpkgs>
    # <lunarispkgs>
  ];

  ############################################################################
  ##                          Program Overrides                             ##
  ############################################################################

  programs.git = {
    extraConfig.credential.helper = "store";
  };
}
