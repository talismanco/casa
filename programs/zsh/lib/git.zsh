###############
# Git Aliases #
###############

alias glgs='glg --show-signature'
alias glol="git log --graph --pretty=format:'%Cgreen%G?%Creset %C(yellow)%h%Creset - %s%C(auto)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola='glol --all'
alias gbv='git branch -vv'
alias gba='git branch -avv'
alias gfa='git fetch --all --prune --tag'
alias gmff='git merge --ff-only'
alias grbp='git rebase -p'
alias gli='git clean -dxn -e ".direnv/" -e "/config/"'
alias gclean='git clean -idx -e ".direnv/" -e "/config/"'
alias gs='git status'
alias gc='git checkout'
alias ga='git add'
alias gaa='git add --all'
alias gtlrm='git tag -d $(git tag -l)'
alias gtrrm='git fetch && git push origin --delete $(git tag -l)'
alias gtrm='gtrrm && gtlrm'

# git-flow
alias gf='git flow'
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
alias gfs='git flow support'

##
## GitHub CLI
##

# Setup
export HUB_PROTOCOL=https

# Aliases
alias hcl='hub clone --recurse-submodules'
alias hi='hub issue'
alias hic='hub issue create'

his() {
    hub issue show $@ | bat -l md
}
