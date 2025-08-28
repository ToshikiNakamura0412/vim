# vim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Environment
### OS
- Linux
  - alpine
  - arch
  - centos (stream)
  - debian
  - fedora
  - opensuse (leap)
  - ubuntu
- macOS

### Architecture
- x86_64
- arm64

## Installation
```bash
git clone https://github.com/ToshikiNakamura0412/vim.git
./vim/install.sh [--with-copilot]
```
## Setup
### plugin
- If you want to enable Github Copilot, execute the following in Vim:
  - Prerequisites: Node.js
  ```
  :Copilot setup
  ```

## Tips
- `Ctrl-n`: Keyword completion

  https://vim-jp.org/vimdoc-en/insert.html#ins-completion

## Troubleshooting
If your Vim does not support clipboard operations, execute the following:
- Prerequisites: wget
```bash
./vim/install_vim_linux_app.sh
```
