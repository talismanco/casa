# =========================================
# === direnv (Setup, Aliases & Helpers) ===
# =========================================

# === Setup ===

eval "$(direnv hook zsh)"

# === Aliases ===

# direnv
alias ds='direnv status'
alias de='direnv edit'
alias da='direnv allow'
alias dn='direnv deny'
alias dp='direnv prune'
alias dr='direnv reload'

# direnv script for persistent cached Nix shells
alias dcl='find .direnv -name "env-*" -and -not -name `readlink .direnv/default` -exec rm -rf {} +'
alias drs='rm -rf .direnv'
alias dar='direnv deny && rm -rf .direnv'

# This one is a helper to locate all the cached Nix shells. The directories you
# want to look at are likely to differ from these ones, so it is only provided
# as an example you may want to override.
alias dl='find ~/builds -name .direnv'

# === Helpers ===
# ...