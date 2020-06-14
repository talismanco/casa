rec {
  file = f: ./. + "/${f}";
  program = p: file "/programs/${p}/nix";

  programs = {
    git = program "git";
    neovim = program "neovim";
    zsh = program "zsh";
  };

  pkgs = import ./nix {};
}