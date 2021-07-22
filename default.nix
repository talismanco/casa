rec {
  file = file: ./. + "/${file}";
  program = program: file "/programs/${program}";

  programs = {
    fzf = program "fzf";
    git = program "git";
    keychain = program "keychain";
    neovim = program "neovim";
    ssh = program "ssh";
    tmux = program "tmux";
    zplug = program "zplug";
    zsh = program "zsh";
  };

  pkgs = import ./nix { };
}
