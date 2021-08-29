# ================================
# === Linux Home Configuration ===
# ================================

{ config, lib, pkgs, ... }:

let config = import ../..;
in rec {
  imports = [ ../common/home.nix ];

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
