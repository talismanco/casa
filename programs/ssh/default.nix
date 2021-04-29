####### Configuration for SSH ##################################################
##                                                                            ##
## * Enable compression                                                       ##
## * Append default configurations via `./config/config                       ##
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

  config = import ../..;
in
rec {
  programs.ssh = {
    enable = true; 
    compression = mkDefault true;
    extraConfig = mkDefault (readFile (config.file "config/ssh.conf"));
  };
}
