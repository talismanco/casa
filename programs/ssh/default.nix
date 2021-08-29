{ lib, pkgs, ... }:

let
  inherit (builtins) readFile;

  config = import ../..;
in rec {
  programs.ssh = {
    enable = true;
    compression = true;
    extraConfig = (readFile (config.file "config/ssh.conf"));
  };
}
