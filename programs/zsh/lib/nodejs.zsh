############################
# NodeJS (Setup & Aliases) #
############################

##
## Setup
##

export NPM_ROOT=$HOME/.npm
export NPM_BIN=$NPM_ROOT/bin

# npm config
export npm_config_prefix=$NPM_ROOT

export PATH=$PATH:$NPM_BIN

# NPM aliases
alias npmrm='rm -rf node_modules package-lock.json'
alias npmrs='npmrm && npm install'

# Standard Version aliases & functions
alias sv='standard-version'
alias svfr='standard-version --first-release'

function svr() {
  standard-version --release-as $1
}

function svpr() {
  standard-version --prerelease alpha --release-as $1
}