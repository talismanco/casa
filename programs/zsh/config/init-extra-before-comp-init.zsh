# Initialize `nix`
if [ -z "$IN_NIX_SHELL" ]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# Initialize environment variables
source $ZDOTDIR/config/env.zsh

# Initialize themes
for file in $ZDOTDIR/themes/*.zsh; do
    source ${file}
done
unset file

# Initialize scripts
for file in $ZDOTDIR/scripts/*.zsh; do
    source ${file}
done
unset file

# Symlink all identities to `.ssh` directory
# Run in sub-shell nullify output to mute,
# failed symlinks.
{
    ln -s $IDENTITIES_DIR/* $SSH_DIR && ls -l $SSH_DIR
} &>/dev/null

# Target directory
cd $(pwd)