# Initialize global variables
source $ZDOTDIR/lib/vars.zsh

# Initialize themes
source $ZDOTDIR/lib/themes/p10k.zsh
source $ZDOTDIR/lib/themes/zsh-autosuggestions.zsh

source $ZDOTDIR/.zsh_plugins.sh

# Symlink all identities to `.ssh` directory
# Run in sub-shell nullify output to mute,
# failed symlinks.
{
    ln -s $IDENTITIES_DIR/* $SSH_DIR && ls -l $SSH_DIR
} &> /dev/null

function export_local_bin() {
    if [ -z "$IN_NIX_SHELL" ]; then
        export PATH=$HOME/.local/bin:$PATH
    fi
}

export_local_bin

for script ($ZDOTDIR/lib/*.zsh); do
    source $script
done
unset script

# direnv shell hook
eval "$(direnv hook zsh)"

# starting directory
cd $HOME