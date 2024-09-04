#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
if [ "$(uname)" = "Linux" ]; then
    source /etc/os-release
    OS_NAME=$(echo $ID)
elif [ "$(uname)" = "Darwin" ]; then
    OS_NAME="mac"
else
    echo "This OS is not supported."
    exit 1
fi

echo ""
echo "install prerequisites..."
if [ $OS_NAME = "ubuntu" ]; then
    sudo apt-get update && sudo apt-get install -y --no-install-recommends \
        curl \
        vim-gtk
elif [ $OS_NAME = "debian" ]; then
    sudo apt-get update && sudo apt-get install -y --no-install-recommends \
        curl \
        vim-gtk3
elif [ $OS_NAME = "alpine" ]; then
    sudo apk update && sudo apk add \
        curl \
        vim
elif [ $OS_NAME = "fedora" ]; then
    sudo dnf check-update && sudo dnf install -y \
        curl \
        vim
elif [ $OS_NAME = "mac" ]; then
    brew install \
        vim
fi
echo ">>> Done"
echo ""

echo ""
echo "setting Vim... "
if [ -d ~/.vim/plugged ]; then
    rm -rf ~/.vim/plugged
fi
if [ -d ~/.vim/undo ]; then
    rm -rf ~/.vim/undo
fi
if [ ! -d ~/.vim/undo ]; then
    mkdir -pv ~/.vim/undo
fi
ln -sfv $SCRIPT_DIR/vimrc ~/.vimrc
ln -sfv $SCRIPT_DIR/basic-settings.vim ~/.vim/basic-settings.vim
ln -sfv $SCRIPT_DIR/keymap.vim ~/.vim/keymap.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ">>> Done"
echo ""
