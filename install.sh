#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

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
echo ""
echo "==="
echo "Finish!!"
echo "==="
