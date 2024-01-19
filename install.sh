#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo ""
echo "setting Vim... "
if [ ! -d ~/.vim/undo ]; then
    mkdir -pv ~/.vim/undo
fi
ln -sfv $SCRIPT_DIR/vimrc ~/.vimrc
ln -sfv $SCRIPT_DIR/basic-settings.vim ~/.vim/basic-settings.vim
ln -sfv $SCRIPT_DIR/keymap.vim ~/.vim/keymap.vim
echo ""
echo "==="
echo "Finish!!"
echo "==="
