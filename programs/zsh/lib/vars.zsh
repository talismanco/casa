#####################################
# Global Variables & Path additions #
#####################################

export WDIR=/mnt/c
export WUSER=conta
export WHOME=$WDIR/Users/$WUSER

export VISUAL=vim
export EDITOR=$VISUAL

export SSH_DIR=$HOME/.ssh
export SSH_AUTH_SOCK=/tmp/wsl-ssh-pageant.socket
export IDENTITIES_DIR=$HOME/.identities

export DIRENV_LOG_FORMAT=""

export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin

export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)