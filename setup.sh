
sudo pacman -S gopls cargo-binstall

cargo binstall --no-confirm neocmakelsp

go install github.com/segmentio/golines@latest
go install mvdan.cc/gofumpt@latest

pnpm -g install vscode-langservers-extracted @tailwindcss/language-server cssmodules-language-server emmet-ls pyright bash-language-server awk-language-server vim-language-server

