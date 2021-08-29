{ lib, pkgs, ... }@args:

let
  inherit (builtins) readFile;
in rec {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "spwhitt/nix-zsh-completions"; }
        { name = "b4b4r07/enhancd"; }
        { name = "supercrabtree/k"; }
        { name = "fcambus/ansiweather"; }
        { name = "chisui/zsh-nix-shell"; }
        {
          name = "arzzen/calc.plugin.zsh";
          tags = [ "use:calc.plugin.zsh" ];
        }
        { name = "ikhurramraza/bol"; }
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" ];
        }
      ];
    };

    initExtraBeforeCompInit = readFile ./config/init-extra-before-comp-init.zsh;
    loginExtra = readFile ./config/login-extra.zsh;
  };
}
