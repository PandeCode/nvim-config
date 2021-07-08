# Fix

pluginConfig/vimify.vim

```vim
let  g:spotify_token = "token"
```

## Other Commands

```bash
ln -s $HOME/.config/nvim/dotfiles/.clang-format $HOME/.clang-format
ln -s $HOME/.config/nvim/dotfiles/.clangd $HOME/.clangd
ln -s $HOME/.config/nvim/dotfiles/.ccls $HOME/.ccls
ln -s $HOME/.config/nvim/dotfiles/.ctags $HOME/.ctags
ln -s $HOME/.config/nvim/dotfiles/.rgignore $HOME/.rgignore
ln -s $HOME/.config/nvim/dotfiles/.cmake-format $HOME/.cmake-format
ln -s $HOME/.config/nvim/dotfiles/.eslintrc $HOME/.eslintrc
ln -s $HOME/.config/nvim/dotfiles/.prettierrc $HOME/.prettierrc
ln -s $HOME/.config/nvim/dotfiles/.pylintrc $HOME/.pylintrc
ln -s $HOME/.config/nvim/dotfiles/.vimspector.json $HOME/.vimspector.json

sudo yay -S clang cmake ccls ripgrep ttf-fira-code ctags ueberzug ffmpegthumbnailer poppler fontpreview fmui-git
python3 -m pip install neovim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
python2 -m pip install neovim

yarn global add neovim
```
