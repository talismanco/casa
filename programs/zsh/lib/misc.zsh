#########################
# Miscellaneous Aliases #
#########################

# Files
if [ `uname` = "Linux" ]; then
    alias ls='ls -h --color=auto'   # Linux
else
    alias ls='ls -Gh'               # BSD
fi
alias tree='tree -C'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias lla='ls -Al'

alias df='df -h'
alias du='du -h'

alias unxz='unxz -kv'

# Home Manager
alias hm='home-manager'
alias hms='home-manager switch && zsh'

# Display available color spectrum
function clicolors() {
    for i in {0..255}; do;
        print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
    done;
}

# Antibody
alias au='antibody bundle < $ZDOTDIR/lib/plugins.txt > ~/.zsh_plugins.sh && zsh'
