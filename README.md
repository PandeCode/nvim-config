# nvim-config

My Neovim config files.

## Packages

### Native

```bash
sudo paru -S ccls clang cmake ctags ffmpegthumbnailer fmui-git fontpreview glsl-language-server poppler ripgrep shfmt ttf-fira-code ueberzug
```

| Package                                                                              | Description                                                                                                    |
| ------------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------------------------:|
| [https://github.com/BurntSushi/ripgrep](BurntSushi/ripgrep)                          | ripgrep recursively searches directories for a regex pattern while respecting your gitignore                   |
| [https://github.com/Kitware/CMake](Kitware/CMake)                                    | Best C/C++ project mangaer                                                                                     |
| [https://github.com/dirkvdb/ffmpegthumbnailer](dirkvdb/ffmpegthumbnailer)            | Lightweight video thumbnailer used by file managers to create thumbnails for video files (telescope preview)   |
| [https://github.com/freedesktop/poppler](freedesktop/poppler)                        | Library for rendering PDF files, and examining or modifying their structure.  (vim-office)                     |
| [https://github.com/sdushantha/fontpreview](sdushantha/fontpreview)                  | Highly customizable and minimal font previewer written in bash (telescope font preview)                        |
| [https://github.com/seebye/ueberzug](seebye/ueberzug)                                | ueberzug is a command line util which allows to display images in combination with X11                         |
| [https://github.com/svenstaro/glsl-language-server](svenstaro/glsl-language-server)  | Language server implementation for GLSL (Pending)                                                              |
| [https://github.com/tmknom/shfmt](tmknom/shfmt)                                      | Dockernized shfmt. This formats shell script.                                                                  |
| [https://github.com/tonsky/FiraCode](tonsky/FiraCode)                                | Free monospaced font with programming ligatures                                                                |
| [https://github.com/universal-ctags/ctags](universal-ctags/ctags)                    | A maintained ctags implementation (vim-gutentags)                                                              |

### Python3

```bash
python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
```

#### Python2 (backwards compatibility)

```bash
python2 -m pip install pynvim
```

| Package                                                        | Description                                                                                                                                |
|----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| https://github.com/neovim/pynvim                               | support for python plugins in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API. |
| https://pypi.org/project/cmakelang                             | The cmake-format project provides Quality Assurance (QA) tools for cmake                                                                   |
| https://github.com/regen100/cmake-language-server              | CMake LSP Implementation                                                                                                                   |
| https://pypi.org/project/black-but-with-tabs-instead-of-spaces | Black is the uncompromising Python code formatter. (BECAUSE TABS RULE OVER SPACES FIGHT ME.)                                               |


### Node

```bash
yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted
```

| Package                                                                         | Description                                                                                                      |
|---------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------:|
| https://github.com/sveltejs/language-tools/tree/master/packages/language-server | A language server (implementing the language server protocol) for Svelte.                                        |
| https://github.com/microsoft/pyright                                            | Static type checker for Python                                                                                   |
| https://github.com/bash-lsp/bash-language-server                                | Bash language server implementation based on Tree Sitter and its grammar for Bash with explainshell integration. |
| https://github.com/bmatcuk/stylelint-lsp                                        | A stylelint Language Server                                                                                      |
| https://github.com/typescript-language-server/typescript-language-server        | Language Server Protocol implementation for TypeScript wrapping tsserver. (also works with js, jsx, tsx)         |
| https://yarnpkg.com/package/neovim                                              | Neovim client API and neovim remote plugin provider                                                              |
| https://github.com/iamcco/vim-language-server                                   | VImScript language server, LSP for vim script                                                                    |
| https://github.com/hrsh7th/vscode-langservers-extracted                         | HTML/CSS/JSON language servers extracted from vscode.                                                            |
| https://github.com/redhat-developer/yaml-language-server                        | Language Server for Yaml Files                                                                                   |


### Lua

```bash
sudo luarocks install --server=https://luarocks.org/dev luaformatter
```
| Package                                | Description                     |
|----------------------------------------|:-------------------------------:|
| https://github.com/Koihik/LuaFormatter | Reformats your Lua source code. |

## Plugins

| Plugin                                                        | Description                                                                                                                                               |
| ------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------:|
| https://github.com/wbthomason/packer.nvim                     | use-package inspired plugin manager for nvim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config          |
| https://github.com/andymass/vim-matchup                       | lets you highlight, navigate, and operate on sets of matching text. It extends vim's % key to language-specific words instead of just single characters.  |
| https://github.com/nvim-treesitter/nvim-treesitter            | Provides a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it:   |
| https://github.com/marko-cerovac/material.nvim                | Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins                                     |
| https://github.com/sudormrfbin/cheatsheet.nvim                | cheatsheet for nvim using Telescope. command autofill, bundled cheats for the editor, plugins, nerd-fonts, etc because hoomans suck at remembering stuff: |
| https://github.com/easymotion/vim-easymotion                  | It takes the (int) out of (int)w or (int)f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target.   |
| https://github.com/preservim/nerdcommenter                    | Comment functions so powerful—no comment necessary.                                                                                                       |
| https://github.com/mg979/vim-visual-multi                     | Multiple cursors plugin for vim/neovim                                                                                                                    |
| https://github.com/kyazdani42/nvim-web-devicons               | A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.                                                          |
| https://github.com/glepnir/dashboard-nvim                     | vim dashboard                                                                                                                                             |
| https://github.com/romainl/vim-cool                           | Vim-cool disables search highlighting when you are done searching and re-enables it when you search again                                                 |
| https://github.com/Shougo/echodoc.vim                         | Displays function signatures from completions in the command line.                                                                                        |
| https://github.com/hoob3rt/lualine.nvim                       | A blazing fast and easy to configure neovim statusline written in pure lua.                                                                               |
| https://github.com/liuchengxu/vista.vim                       | View and search LSP symbols, tags in Vim/NeoVim.                                                                                                          |
| https://github.com/akinsho/bufferline.nvim                    | A snazzy nail_care buffer line (with minimal tab integration) for Neovim built using lua.                                                                 |
| https://github.com/ludovicchabant/vim-gutentags               | management of tags files in. (re)generate tag files as you work. It will even do its best to keep those tag files out of your way too.                    |
| https://github.com/tpope/vim-surround                         | parentheses,brackets,quotes,XML tags, and more. mappings to easily delete, change and add such surroundings in pairs.                                     |
| https://github.com/tpope/vim-repeat                           | repeat.vim: enable repeating supported plugin maps with "."                                                                                               |
| https://github.com/glacambre/firenvim                         | Embed Neovim in your browser.                                                                                                                             |
| https://github.com/petrbroz/vim-glsl                          | syntax highlighting or code folding for standard OpenGL ES 1.0 shaders, and for additional directives used in three.js (for example, #include).           |
| https://github.com/tikhomirov/vim-glsl                        | Vim syntax highlighting for OpenGL Shading Language                                                                                                       |
| https://github.com/tpope/vim-speeddating                      | use CTRL-A/CTRL-X to increment dates, times, and more                                                                                                     |
| https://github.com/folke/which-key.nvim                       | lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.                                              |
| https://github.com/jackguo380/vim-lsp-cxx-highlight           | Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd                                                                             |
| https://github.com/jeffkreeftmeijer/vim-numbertoggle          | Toggles between hybrid and absolute line numbers automatically                                                                                            |
| https://github.com/chaoren/vim-wordmotion                     | More useful word motions for Vim                                                                                                                          |
| https://github.com/junegunn/vim-easy-align                    | A simple, easy-to-use Vim alignment plugin.                                                                                                               |
| https://github.com/habamax/vim-godot                          | Use vim and godot engine to make games                                                                                                                    |
| https://github.com/airblade/vim-gitgutter                     | A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.                                          |
| https://github.com/haya14busa/incsearch.vim                   | Improved incremental searching for Vim                                                                                                                    |
| https://github.com/haya14busa/incsearch-fuzzy.vim             | incremantal fuzzy search extension for incsearch.vim                                                                                                      |
| https://github.com/haya14busa/incsearch-easymotion.vim        | Integration between haya14busa/incsearch.vim and easymotion/vim-easymotion                                                                                |
| https://github.com/sbdchd/neoformat                           | sparkles A (Neo)vim plugin for formatting code.                                                                                                           |
| https://github.com/google/vim-maktaba                         | Consistent Vimscript (vim-bazel)                                                                                                                          |
| https://github.com/google/vim-glaive                          | Glaive is a utility for configuring maktaba plugins.(vim-bazel, vim-maktaba)                                                                              |
| https://github.com/bazelbuild/vim-bazel                       | Vim support for Bazel                                                                                                                                     |
| https://github.com/Yggdroot/indentLine                        | A vim plugin to display the indention levels with thin vertical lines                                                                                     |
| https://github.com/luochen1990/rainbow                        | Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.                                                      |
| https://github.com/kkoomen/vim-doge                           | (Do)cumentation (Ge)nerator 10+ languages books Generate proper code documentation skeletons with a single keypress. zapfire                              |
| https://github.com/neoclide/jsonc.vim                         | jsonc syntax support for vim (Pending)                                                                                                                    |
| https://github.com/voldikss/vim-floaterm                      | star2 Terminal manager for (neo)vim                                                                                                                       |
| https://github.com/antoinemadec/FixCursorHold.nvim            | Fix CursorHold Performance.                                                                                                                               |
| https://github.com/itchyny/vim-cursorword                     | Underlines the word under the cursor                                                                                                                      |
| https://github.com/tpope/vim-fugitive                         | A Git wrapper so awesome, it should be illegal                                                                                                            |
| https://github.com/nvim-lua/plenary.nvim                      | plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. (telescope)                                    |
| https://github.com/nvim-lua/popup.nvim                        | [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete(telescope)                                                    |
| https://github.com/nvim-telescope/telescope.nvim              | highly extendable fuzzy finder over lists. Telescope is centered around modularity, allowing for easy customization.                                      |
| https://github.com/nvim-telescope/telescope-media-files.nvim  | Telescope extension to preview media files using Ueberzug. (telescope)                                                                                    |
| https://github.com/nvim-telescope/telescope-github.nvim       | Integration with github cli (telescope)                                                                                                                   |
| https://github.com/nvim-telescope/telescope-dap.nvim          | Integration for nvim-dap with telescope.nvim                                                                                                              |
| https://github.com/Pocco81/DAPInstall.nvim                    | A NeoVim plugin for managing several debuggers for Nvim-dap.                                                                                              |
| https://github.com/neovim/nvim-lspconfig                      | Quickstart configurations for the Nvim LSP client                                                                                                         |
| https://github.com/hrsh7th/nvim-cmp                           | Auto completion Lua plugin for nvim                                                                                                                       |
| https://github.com/onsails/lspkind-nvim                       | vscode-like pictograms for neovim lsp completion items                                                                                                    |
| https://github.com/windwp/nvim-autopairs                      | autopairs for neovim written by lua                                                                                                                       |
| https://github.com/hrsh7th/vim-vsnip                          | Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.                                                                                    |
| https://github.com/hoob3rt/lualine.nvim                       | A blazing fast and easy to configure neovim statusline plugin written in pure lua.                                                                        |
| https://github.com/kyazdani42/nvim-tree.lua                   | A file explorer tree for neovim written in lua                                                                                                            |
| https://github.com/RishabhRD/nvim-lsputils                    | Better defaults for nvim-lsp actions                                                                                                                      |
| https://github.com/RishabhRD/popfix                           | Neovim lua API for highly extensible quickfix window. (nvim-lsputils)                                                                                     |
| https://github.com/mfussenegger/nvim-dap                      | Debug Adapter Protocol client implementation for Neovim (>= 0.5)                                                                                          |
| https://github.com/rcarriga/nvim-dap-ui                       | A UI for nvim-dap                                                                                                                                         |
| https://github.com/theHamsta/nvim-dap-virtual-text            | This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.                                                  |
| https://github.com/skywind3000/asyncrun.vim                   | rocket Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!                                                                  |
| https://github.com/Shatur/neovim-cmake                        | CMake integration for Neovim                                                                                                                              |
| https://github.com/dbeniamine/cheat.sh-vim                    | This is a highly configurable vim plugin to browse cheat sheet from cheat.sh directly from vim.                                                           |
| https://github.com/simnalamburt/vim-mundo                     | Graph your Vim undo tree in style.                                                                                                                        |
| https://github.com/ap/vim-css-color                           | Preview colours in source code while editing                                                                                                              |
| https://github.com/bfredl/nvim-luadev                         | REPL/debug console for nvim lua plugins                                                                                                                   |
| https://github.com/Iron-E/nvim-libmodal                       | Create new "modes" for Neovim!                                                                                                                            |
| https://github.com/wakatime/wakatime                          | wakatime for progress tracking                                                                                                                            |
| https://github.com/andweeb/presence.nvim                      | Discord Rich Presence for Neovim                                                                                                                          |
| https://github.com/jbyuki/one-small-step-for-vimkind          | Debug adapter for Neovim plugins                                                                                                                          |
| https://github.com/lewis6991/impatient.nvim                   | Improve startup time for Neovim                                                                                                                           |
| https://github.com/folke/todo-comments.nvim                   | Highlight, list and search todo comments in your projects.                                                                                                |


