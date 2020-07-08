rec {
  file = f: ./. + "/${f}";
  program = p: file "/programs/${p}";

  programs = {
    git = program "git";
    jq = program "jq";
    keychain = program "keychain";
    neovim = program "neovim";
    ssh = program "ssh";
    tmux = program "tmux";
    zsh = program "zsh";
  };

  pkgs = import ./nix {};
}