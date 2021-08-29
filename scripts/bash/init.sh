get_platform () {
  local platform="$(uname | tr '[:upper:]' '[:lower:]')"
  
  case "$platform" in
    linux|darwin)
      echo "Platform '${platform}' supported!" >&2
    ;;
    *)
      echo "Platform '${platform}' not supported!" >&2
      exit 1
    ;;
  esac
  
  echo -n $platform
}

install_nix () {
  if ! [ $(command -v nix) ]; then
    curl -L https://nixos.org/nix/install | sh
  else
    echo "Nix is already installed!"  
  fi
}

install_home_manager () {
  if ! [ $(command -v home-manager) ]; then
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
  else
    echo "Home Manager is already installed!"  
  fi
}

install_home_manager_profile () {
  local platform=$1
  local hm_home=$HOME/.config/nixpkgs/home.nix
  local hm_platform=$(pwd)/profiles/$platform/home.nix
  
  rm -f $hm_home
  ln -s $hm_platform $hm_home
}

init () {
  local platform=$(get_platform)

  install_nix
  install_home_manager_profile $platform
  install_home_manager
}

init