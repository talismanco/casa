{ pkgs, lib, ... }:

rec {
  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
  };
}
