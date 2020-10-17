###################################
# WSL Utility Functions & Aliases #
###################################

alias code="/mnt/c/Users/conta/AppData/Local/Programs/Microsoft\ VS\ Code\ Insiders/Code\ -\ Insiders.exe --remote wsl+Ubuntu-18.04"

alias fix-wsl="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""