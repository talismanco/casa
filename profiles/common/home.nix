################################################################################
##                                                                            ##
##                         Common home configuration                          ##
##                                                                            ##
################################################################################

{ pkgs, lib, ... }:

let
  inherit (builtins) readFile;
  inherit (lib) mkDefault mkForce;

  config = import ../..;
in
rec {
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  home.stateVersion = "19.03";

  imports = with config.programs; [
    git
    neovim
  ];

  ############################################################################
  ##                             User packages                              ##
  ############################################################################

  home.packages = with pkgs; with config.pkgs; [
    # <nixpkgs>
    direnv
    gitAndTools.gitflow
    # <lunarispkgs>
    lunarispkgs.bazel
    lunarispkgs.go
    lunarispkgs.google-cloud-sdk
    lunarispkgs.nodejs
    lunarispkgs.openjdk
    lunarispkgs.skaffold
  ];


  ############################################################################
  ##                          Custom configuration                          ##
  ############################################################################

  home.file = {
    # npm config
    ".npmrc".source = config.file "config/.npmrc";

    # gnupg config
    ".gnupg/gpg.conf".text = ''
        default-key <fpr>
      '' + readFile (config.file "config/gpg.conf");

    # zsh aliases, environments, themes & functions
    ".zsh".source = config.file "programs/zsh/lib";

    # ssh config
    ".ssh".source = config.file "programs/ssh/config";
  };

  ############################################################################
  ##                                 Programs                               ##
  ############################################################################

  programs.home-manager = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    initExtra = 
      mkForce (''
        if [ -z "$IN_NIX_SHELL" ]; then
            source ${pkgs.antigen}/share/antigen/antigen.zsh
            source $HOME/.nix-profile/etc/profile.d/nix.sh
            export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
        fi
      '' +
      readFile (config.file "programs/zsh/bin/before.zsh")
      + "\n" +
      readFile (config.file "programs/zsh/bin/after.zsh"));
  };

  ############################################################################
  ##                                 Services                               ##
  ############################################################################

  services = {
    lorri.enable = true;
    keybase.enable = true;
  };
}
