#!/bin/env bash
sudo yay -S clang cmake ccls ripgrep ttf-fira-code ctags ueberzug ffmpegthumbnailer poppler fontpreview fmui-git shfmt glsl-language-server

python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
python2 -m pip install pynvim

yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted
