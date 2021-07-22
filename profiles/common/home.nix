# =================================
# === Common Home Configuration ===
# =================================

{ lib, pkgs, ... }:

let
  config = import ../..;
in rec {

  # === Configuration ===

  home.stateVersion = "20.09";

  home.file = {
    # `zsh` config
    ".config/zsh/config".source = config.file "programs/zsh/config";
    ".config/zsh/config".recursive = true;
    # `zsh` scripts
    ".config/zsh/scripts".source = config.file "programs/zsh/scripts";
    ".config/zsh/scripts".recursive = true;
    # `zsh` themes
    ".config/zsh/themes".source = config.file "programs/zsh/themes";
    ".config/zsh/themes".recursive = true;
  };

  # === User Packages ===

  home.packages = with config.pkgs; [
    # <nixpkgs>
    nixpkgs.act
    nixpkgs.antibody
    nixpkgs.direnv
    nixpkgs.gitAndTools.gh
    nixpkgs.gitAndTools.gitflow
    nixpkgs.glow
    nixpkgs.ngrok
    nixpkgs.nixfmt
    nixpkgs.vault
    nixpkgs.vimPlugins.vim-plug
    # <talismanpkgs>
    talismanpkgs.bazel
    talismanpkgs.cargo
    talismanpkgs.clippy
    talismanpkgs.go
    talismanpkgs.google-cloud-sdk
    talismanpkgs.helm
    talismanpkgs.jq
    talismanpkgs.k9s
    talismanpkgs.mirror
    talismanpkgs.nodejs
    talismanpkgs.openjdk
    talismanpkgs.python
    talismanpkgs.rustc
    talismanpkgs.skaffold
  ];

  # === Programs ===

  imports = with config.programs; [ git fzf keychain neovim ssh tmux zsh ];

  programs.home-manager = { enable = true; };

  # === Services ===

  services.lorri = {
    enable = true;
    package = config.pkgs.nixpkgs.lorri;
  };
}
