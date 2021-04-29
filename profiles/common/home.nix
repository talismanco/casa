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
    act
    antibody
    direnv
    gitAndTools.gh
    gitAndTools.gitflow
    glow
    ngrok
    vault
    vimPlugins.vim-plug
    # <talismanpkgs>
    talismanpkgs.bazel
    talismanpkgs.cargo
    talismanpkgs.clippy
    talismanpkgs.go
    talismanpkgs.google-cloud-sdk
    talismanpkgs.helm
    talismanpkgs.k9s
    talismanpkgs.mirror
    talismanpkgs.nodejs
    talismanpkgs.openjdk
    talismanpkgs.python
    talismanpkgs.rustc
    talismanpkgs.skaffold
  ];

  ############################################################################
  ##                          Custom configuration                          ##
  ############################################################################

  home.file = {
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
