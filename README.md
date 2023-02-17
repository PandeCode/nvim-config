# Nvim Config
My personal configuration for [https://github.com/neovim/neovim](neovim).

## Supported languages
 - C
 - C++
 - Golang
 - Lua
 - Rust
 - Javascript(react)
 - Typescript(react)
 - Vimscript

## Dependencies

### Arch linux
https://github.com/golang/tools/tree/master/gopls

sudo pacman -S gopls cargo-binstall

### Rust Deps (cargo-binstall installed)
Decodetalkers/neocmakelsp

```bash
cargo binstall --no-confirm neocmakelsp
```

### Go Deps

```bash
go install github.com/segmentio/golines@latest
go install mvdan.cc/gofumpt@latest
```


### Node Deps (pnpm installed)
tailwindlabs/tailwindcss-intellisense
antonk52/cssmodules-language-server
hrsh7th/vscode-langservers-extracted
aca/emmet-ls
microsoft/pyright
mads-hartmann/bash-language-server
Beaglefoot/awk-language-server
iamcco/vim-language-server

```bash
pnpm -g install vscode-langservers-extracted @tailwindcss/language-server cssmodules-language-server emmet-ls pyright bash-language-server awk-language-server vim-language-server
```

## Extensions 

| Extension | Description |
|-|-|
| [https://github.com/lewis6991/impatient.nvim](lewis6991/impatient.nvim) | Improve startup time for Neovim |
| [https://github.com/marko-cerovac/material.nvim](marko-cerovac/material.nvim) | :trident: Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins |
| [https://github.com/stevearc/dressing.nvim](stevearc/dressing.nvim) | Neovim plugin to improve the default vim.ui interfaces |
| [https://github.com/airblade/vim-gitgutter](airblade/vim-gitgutter) | A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks. |
| [https://github.com/ap/vim-css-color](ap/vim-css-color) | Preview colours in source code while editing |
| [https://github.com/chaoren/vim-wordmotion](chaoren/vim-wordmotion) | More useful word motions for Vim |
| [https://github.com/itchyny/vim-cursorword](itchyny/vim-cursorword) | Underlines the word under the cursor |
| [https://github.com/mg979/vim-visual-multi](mg979/vim-visual-multi) | Multiple cursors plugin for vim/neovim |
| [https://github.com/rcarriga/nvim-notify](rcarriga/nvim-notify) | A fancy, configurable, notification manager for NeoVim |
| [https://github.com/romainl/vim-cool](romainl/vim-cool) | A very simple plugin that makes hlsearch more useful. |
| [https://github.com/tpope/vim-repeat](tpope/vim-repeat) | repeat.vim: enable repeating supported plugin maps with "." |
| [https://github.com/windwp/nvim-autopairs](windwp/nvim-autopairs) | autopairs for neovim written by lua |
| [https://github.com/kylechui/nvim-surround](kylechui/nvim-surround) | Add/change/delete surrounding delimiter pairs with ease. Written with :heart: in Lua. |
| [https://github.com/chentoast/marks.nvim](chentoast/marks.nvim) | A better user experience for viewing and interacting with Vim marks. |
| [https://github.com/folke/todo-comments.nvim](folke/todo-comments.nvim) | ✅  Highlight, list and search todo comments in your projects |
| [https://github.com/Iron-E/nvim-libmodal](Iron-E/nvim-libmodal) | Create new "modes" for Neovim! |
| [https://github.com/junegunn/vim-easy-align](junegunn/vim-easy-align) | :sunflower: A Vim alignment plugin |
| [https://github.com/mbbill/undotree](mbbill/undotree) | The undo history visualizer for VIM |
| [https://github.com/preservim/nerdcommenter](preservim/nerdcommenter) | Vim plugin for intensely nerdy commenting powers |
| [https://github.com/sbdchd/neoformat](sbdchd/neoformat) | :sparkles: A (Neo)vim plugin for formatting code. |
| [https://github.com/ludovicchabant/vim-gutentags](ludovicchabant/vim-gutentags) | A Vim plugin that manages your tag files |
| [https://github.com/andymass/vim-matchup](andymass/vim-matchup) | vim match-up: even better % :facepunch: navigate and highlight matching words :facepunch: modern matchit and matchparen.  Supports both vim and neovim + tree-sitter. |
| [https://github.com/nvim-tree/nvim-web-devicons](nvim-tree/nvim-web-devicons) | lua `fork` of vim-web-devicons for neovim |
| [https://github.com/akinsho/bufferline.nvim](akinsho/bufferline.nvim) | A snazzy bufferline for Neovim |
| [https://github.com/nvim-lualine/lualine.nvim](nvim-lualine/lualine.nvim) | A blazing fast and easy to configure neovim statusline plugin written in pure lua. |
| [https://github.com/glepnir/dashboard-nvim](glepnir/dashboard-nvim) | vim dashboard |
| [https://github.com/nvim-telescope/telescope.nvim](nvim-telescope/telescope.nvim) | Find, Filter, Preview, Pick. All lua, all the time. |
| [https://github.com/nvim-lua/plenary.nvim](nvim-lua/plenary.nvim) | plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. |
| [https://github.com/nvim-orgmode/orgmode](nvim-orgmode/orgmode) | Orgmode clone written in Lua for Neovim 0.7+. |
| [https://github.com/mrjones2014/nvim-ts-rainbow](mrjones2014/nvim-ts-rainbow) | Rainbow parentheses for neovim using tree-sitter. |
| [https://github.com/nvim-treesitter/nvim-treesitter](nvim-treesitter/nvim-treesitter) | Nvim Treesitter configurations and abstraction layer |
| [https://github.com/lukas-reineke/indent-blankline.nvim](lukas-reineke/indent-blankline.nvim) | Indent guides  for Neovim |
| [https://github.com/nvim-treesitter/nvim-treesitter-textobjects](nvim-treesitter/nvim-treesitter-textobjects) | null |
| [https://github.com/nvim-treesitter/playground](nvim-treesitter/playground) | Treesitter playground integrated into Neovim |
| [https://github.com/hrsh7th/nvim-cmp](hrsh7th/nvim-cmp) | A completion plugin for neovim coded in Lua. |
| [https://github.com/hrsh7th/cmp-nvim-lsp](hrsh7th/cmp-nvim-lsp) | nvim-cmp source for neovim builtin LSP client |
| [https://github.com/quangnguyen30192/cmp-nvim-tags](quangnguyen30192/cmp-nvim-tags) | tags sources for nvim-cmp |
| [https://github.com/hrsh7th/cmp-buffer](hrsh7th/cmp-buffer) | nvim-cmp source for buffer words |
| [https://github.com/hrsh7th/cmp-path](hrsh7th/cmp-path) | nvim-cmp source for path |
| [https://github.com/hrsh7th/cmp-cmdline](hrsh7th/cmp-cmdline) | nvim-cmp source for vim's cmdline |
| [https://github.com/L3MON4D3/LuaSnip](L3MON4D3/LuaSnip) | Snippet engine for Neovim written in Lua. |
| [https://github.com/saadparwaiz1/cmp_luasnip](saadparwaiz1/cmp_luasnip) | luasnip completion source for nvim-cmp |
| [https://github.com/neovim/nvim-lspconfig](neovim/nvim-lspconfig) | Quickstart configs for Nvim LSP |
| [https://github.com/j-hui/fidget.nvim](j-hui/fidget.nvim) | Standalone UI for nvim-lsp progress |
| [https://github.com/kevinhwang91/nvim-ufo](kevinhwang91/nvim-ufo) | Not UFO in the sky, but an ultra fold in Neovim. |
| [https://github.com/kevinhwang91/promise-async](kevinhwang91/promise-async) | Promise & Async in Lua |
| [https://github.com/folke/neodev.nvim](folke/neodev.nvim) | 💻  Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API. |
| [https://github.com/p00f/clangd_extensions.nvim](p00f/clangd_extensions.nvim) | Clangd's off-spec features for neovim's LSP client. Use https://sr.ht/~p00f/clangd_extensions.nvim instead |
| [https://github.com/ray-x/go.nvim](ray-x/go.nvim) | Modern Go dev plugin, based on gopls, treesitter AST, Dap and a variety of go tools. |
| [https://github.com/simrat39/rust-tools.nvim](simrat39/rust-tools.nvim) | Tools for better development in rust using neovim's builtin lsp |
| [https://github.com/b0o/SchemaStore.nvim](b0o/SchemaStore.nvim) | 🛍 JSON schemas for Neovim |
| [https://github.com/mfussenegger/nvim-dap](mfussenegger/nvim-dap) | Debug Adapter Protocol client implementation for Neovim |
| [https://github.com/rcarriga/nvim-dap-ui](rcarriga/nvim-dap-ui) | A UI for nvim-dap |
| [https://github.com/kkoomen/vim-doge](kkoomen/vim-doge) | (Do)cumentation (Ge)nerator 10+ languages 📚 Generate proper code documentation skeletons with a single keypress. ⚡️🔥 |
| [https://github.com/ThePrimeagen/refactoring.nvim](ThePrimeagen/refactoring.nvim) | The Refactoring library based off the Refactoring book by Martin Fowler |
| [https://github.com/wakatime/vim-wakatime](wakatime/vim-wakatime) | Vim plugin for automatic time tracking and metrics generated from your programming activity. |
| [https://github.com/folke/which-key.nvim](folke/which-key.nvim) | 💥   Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing. |
| [https://github.com/Eandrju/cellular-automaton.nvim](Eandrju/cellular-automaton.nvim) | A useless plugin that might help you cope with stubbornly broken tests or overall lack of sense in life. It lets you execute aesthetically pleasing, cellular automaton animations based on the content of neovim buffer. |
| [https://github.com/jose-elias-alvarez/typescript.nvim](jose-elias-alvarez/typescript.nvim) | A Lua plugin, written in TypeScript, to write TypeScript (Lua optional). |

## Future
https://github.com/nullchilly/CatNvim
https://github.com/noib3/nvim-oxi
