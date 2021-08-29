###################################
# WSL Utility Functions & Aliases #
###################################

# === Aliases ===

alias fix-wsl="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

# === Functions ===

function code() {
  local target=$1
  target_path="$(pwd)/${target}"

  if [[ "${target}" == "." || -z "${target}" ]]; then
    target_path="$(pwd)"
  fi

  if [[ -d ${target} || -f ${target} ]]; then
    target_path=${target}
  fi
  
  local vscode_exe="$WHOME/AppData/Local/Programs/Microsoft VS Code/Code.exe"
  /init eval "$(${vscode_exe} --remote wsl+$WSL_DISTRO_NAME --new-window ${target_path})"
}