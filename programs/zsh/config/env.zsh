# =============================
# === Environment Variables ===
# =============================

export WDIR=/mnt/c
export WUSER=conta
export WHOME=$WDIR/Users/$WUSER

export VISUAL=vim
export EDITOR=$VISUAL

export SSH_DIR=$HOME/.ssh
export IDENTITIES_DIR=$HOME/.identities

# Non `nix-shell` variables
if [ -z "$IN_NIX_SHELL" ]; then
    export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
    export PATH=$HOME/.local/bin:$PATH
fi

# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)