################################################################################
##                                                                            ##
##                         Common home configuration                          ##
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
  ;

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
    jq
    keychain
    neovim
    ssh
    tmux
    zsh
  ];

  ############################################################################
  ##                             User packages                              ##
  ############################################################################

  home.packages = with pkgs; with config.pkgs; [
    # <nixpkgs>
    antibody
    direnv
    gitAndTools.gitflow
    vimPlugins.vim-plug
    # <lunarispkgs>
    lunarispkgs.bazel
    lunarispkgs.cargo
    lunarispkgs.clippy
    lunarispkgs.go
    lunarispkgs.google-cloud-sdk
    lunarispkgs.helm
    lunarispkgs.k9s
    lunarispkgs.mirror
    lunarispkgs.nodejs
    lunarispkgs.openjdk
    lunarispkgs.rustc
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
    ".config/zsh/lib".source = config.file "programs/zsh/lib";
  };

  programs.home-manager = {
    enable = true;
  };

  ############################################################################
  ##                                 Services                               ##
  ############################################################################

  services = {
    lorri.enable = true;
    keybase.enable = true;
  };
}
