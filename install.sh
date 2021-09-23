#!/bin/env bash
sudo yay -S clang cmake ccls ripgrep ttf-fira-code ctags ueberzug ffmpegthumbnailer poppler fontpreview fmui-git shfmt glsl-language-server

python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
python2 -m pip install pynvim

yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted

ln -s ~/.config/nvim/dotfiles/.ccls             ~/.ccls
ln -s ~/.config/nvim/dotfiles/.clang-format     ~/.clang-format
ln -s ~/.config/nvim/dotfiles/.cmake-format     ~/.cmake-format
ln -s ~/.config/nvim/dotfiles/.ctags            ~/.ctags
ln -s ~/.config/nvim/dotfiles/.eslintrc         ~/.eslintrc
ln -s ~/.config/nvim/dotfiles/.lua-format       ~/.lua-format
ln -s ~/.config/nvim/dotfiles/.prettierrc       ~/.prettierrc
ln -s ~/.config/nvim/dotfiles/.pylintrc         ~/.pylintrc
ln -s ~/.config/nvim/dotfiles/.rgignore         ~/.rgignore

