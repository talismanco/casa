# ================================
# === Linux Home Configuration ===
# ================================

{ config, lib, pkgs, ... }:

let config = import ../..;
in rec {
  imports = [ ../common/home.nix ];

  # === Configuration ===

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  # === User Packages ===

  home.packages = with config.pkgs;
    [
      # <nixpkgs>
      # ...
      # <talismanpkgs>
      # ...
    ];

  # === Programs ===

  programs.git = { extraConfig.credential.helper = "store"; };

  # === Services ===

}
