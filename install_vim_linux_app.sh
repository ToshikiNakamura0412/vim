#!/bin/bash

VIM_ARCH=$(arch)
VIM_APP_DIR="$HOME/.local/bin"

vim_install_linux_app() {
  local app_dir="${VIM_APP_DIR}"

  mkdir -pv "${app_dir}"
  wget -vO "${app_dir}/vim" "https://github.com/vim/vim-appimage/releases/download/v9.1.1610/GVim-v9.1.1610.glibc2.34-x86_64.AppImage"
  chmod +x "${app_dir}/vim"
}

vim_install_linux_app_add_to_path() {
  if [[ -e "${VIM_APP_DIR}/vim" ]]; then
    local target_string="export PATH=\$HOME/.local/bin:\$PATH"
    local target_files=(
      "$HOME/.bashrc"
      "$HOME/.zshrc"
    )

    for target_file in "${target_files[@]}"; do
      if [[ -e "${target_file}" ]]; then
        if ! grep -q "${target_string}" ${target_file}; then
          echo "[INFO] Adding \"${target_string}\" to ${target_file}"
          echo "${target_string}" >> "${target_file}"
        fi
      fi
    done

    echo "[INFO] Vim installed successfully. Please restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc' to update your PATH."
  else
    echo "[ERROR] Vim installation failed. Please check the logs for errors."
  fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  if [[ "${VIM_ARCH}" == "x86_64" ]]; then
    vim_install_linux_app
    vim_install_linux_app_add_to_path
  else
    echo "[ERROR] Unsupported architecture: ${VIM_ARCH}. This script only supports x86_64 architecture."
    exit 1
  fi
fi
