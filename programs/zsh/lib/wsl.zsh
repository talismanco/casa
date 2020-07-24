###################################
# WSL Utility Functions & Aliases #
###################################

function fix-wsl() {
  echo "echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run" | sudo sh
}

alias code="/mnt/c/Users/conta/AppData/Local/Programs/Microsoft\ VS\ Code\ Insiders/Code\ -\ Insiders.exe --remote wsl+Ubuntu-18.04"
