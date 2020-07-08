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

  config = import "../..";
in
{
  programs.ssh = {
    enable = true; 
    compression = true;
    extraConfig = readFile (config.file "programs/ssh/config/config");
  };
}
