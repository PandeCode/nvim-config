#!/bin/env bash
sudo yay -S clang cmake ccls ripgrep ttf-fira-code ctags ueberzug ffmpegthumbnailer poppler fontpreview fmui-git shfmt glsl-language-server

python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
python2 -m pip install pynvim

yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted

ln -s ./dotfiles/.ccls             ~/.ccls
ln -s ./dotfiles/.clang-format     ~/.clang-format
ln -s ./dotfiles/.cmake-format     ~/.cmake-format
ln -s ./dotfiles/.ctags            ~/.ctags
ln -s ./dotfiles/.eslintrc         ~/.eslintrc
ln -s ./dotfiles/.lua-format       ~/.lua-format
ln -s ./dotfiles/.prettierrc       ~/.prettierrc
ln -s ./dotfiles/.pylintrc         ~/.pylintrc
ln -s ./dotfiles/.rgignore         ~/.rgignore
ln -s ./dotfiles/.vimspector.json  ~/.vimspector.json

