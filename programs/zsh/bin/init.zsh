# Initialize global variables
source $ZDOTDIR/lib/vars.zsh

# Initialize themes
source $ZDOTDIR/lib/themes/p10k.zsh
source $ZDOTDIR/lib/themes/zsh-autosuggestions.zsh

source $ZDOTDIR/.zsh_plugins.sh

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

export_local_bin

# direnv shell hook
eval "$(direnv hook zsh)"

# starting directory
cd $HOME