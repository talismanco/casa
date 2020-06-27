rec {
  file = f: ./. + "/${f}";
  program = p: file "/programs/${p}";

  programs = {
    git = program "git";
    jq = program "jq";
    neovim = program "neovim";
    tmux = program "tmux";
    zsh = program "zsh";
  };

  pkgs = import ./nix {};
}