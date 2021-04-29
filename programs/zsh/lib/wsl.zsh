###################################
# WSL Utility Functions & Aliases #
###################################

alias code="/mnt/c/Users/conta/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe --remote wsl+Ubuntu-18.04 --goto"

alias fix-wsl="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""