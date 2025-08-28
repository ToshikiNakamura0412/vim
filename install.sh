#!/bin/bash

VIM_INSTALL_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

vim_get_script_dir() {
  echo "${VIM_INSTALL_SCRIPT_DIR}"
}

vim_get_os_name() {
  if [[ "$(uname)" = "Linux" ]]; then
    source /etc/os-release
    echo "${ID}"
  elif [[ "$(uname)" = "Darwin" ]]; then
    echo "mac"
  else
    echo "[ERROR] This OS is not supported."
    exit 1
  fi
}

vim_install_prerequisites() {
  local os_name="$(vim_get_os_name)"

  echo ""
  echo "[INFO] Installing prerequisites..."
  if [[ "${os_name}" = "ubuntu" || "${os_name}" = "debian" ]]; then
    sudo apt-get update && sudo apt-get install -y --no-install-recommends \
      curl \
      vim-gtk3
  elif [[ "${os_name}" = "alpine" ]]; then
    sudo apk update && sudo apk add --no-cache \
      curl \
      vim
  elif [[ "${os_name}" = "fedora" ]]; then
    sudo dnf check-update || true && sudo dnf install -y --setopt=install_weak_deps=False \
      curl \
      vim
  elif [[ "${os_name}" = "centos" ]]; then
    sudo dnf check-update || true && sudo dnf install -y --setopt=install_weak_deps=False \
      curl-minimal \
      vim
  elif [[ "${os_name}" = "opensuse-leap" ]]; then
    sudo zypper refresh && sudo zypper install -y --no-recommends \
      curl \
      vim
  elif [[ "${os_name}" = "arch" ]]; then
    sudo pacman -Sy --noconfirm \
      curl \
      vim
  elif [[ "${os_name}" = "mac" ]]; then
    brew install \
      vim
  else
    echo "[ERROR] Unsupported OS: ${os_name}"
    exit 1
  fi
  echo "[INFO] >>> Done"
  echo ""
}

vim_setup() {
  local script_dir="$(vim_get_script_dir)"

  echo ""
  echo "[INFO] Setting Vim... "
  if [[ -d ~/.vim/plugged ]]; then
    rm -rf ~/.vim/plugged
  fi
  if [[ -d ~/.vim/undo ]]; then
    rm -rf ~/.vim/undo
  fi
  if [[ ! -d ~/.vim/undo ]]; then
    mkdir -pv ~/.vim/undo
  fi
  ln -sfv "${script_dir}/vimrc" ~/.vimrc
  ln -sfv "${script_dir}/basic-settings.vim" ~/.vim/basic-settings.vim
  ln -sfv "${script_dir}/keymap.vim" ~/.vim/keymap.vim
  echo "[INFO] >>> Done"
  echo ""
}

vim_main() {
  vim_install_prerequisites
  vim_setup
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  vim_main

  if [[ "$1" == "--with-copilot" ]]; then
    sed -i 's/^"\s*\(Plug .*\)/\1/' "$(vim_get_script_dir)/vimrc"
    echo "[INFO] Copilot enabled. Please open Vim and run \`:Copilot setup\` to complete the setup."
  fi
fi
