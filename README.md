# nvim-config

My Neovim config files.

## Packages

### Native

```bash
sudo paru -S ccls clang cmake ctags ffmpegthumbnailer fmui-git fontpreview glsl-language-server poppler ripgrep shfmt ttf-fira-code ueberzug
```

| Package                                                                              | Description                                                                                                     |
|--------------------------------------------------------------------------------------|-:-------------------------------------------------------------------------------------------------------------:-|
| [https://github.com/BurntSushi/ripgrep](ushi/ripgrep)                                | ripgrep recursively searches directories for a regex pattern while respecting your gitignore                    |
| [https://github.com/Kitware/CMake](CMake)                                            | Best C/C++ project mangaer                                                                                      |
| [https://github.com/dirkvdb/ffmpegthumbnailer](ffmpegthumbnailer)                    | Lightweight video thumbnailer used by file managers to create thumbnails for video files (telescope preview)    |
| [https://github.com/freedesktop/poppler](poppler)                                    | Library for rendering PDF files, and examining or modifying their structure.  (vim-office)                      |
| [https://github.com/sdushantha/fontpreview](fontpreview)                             | Highly customizable and minimal font previewer written in bash (telescope font preview)                         |
| [https://github.com/seebye/ueberzug](ueberzug)                                       | ueberzug is a command line util which allows to display images in combination with X11                          |
| [https://github.com/svenstaro/glsl-language-server](glsl-language-server)            | Language server implementation for GLSL (Pending)                                                               |
| [https://github.com/tmknom/shfmt](shfmt)                                             | Dockernized shfmt. This formats shell script.                                                                   |
| [https://github.com/tonsky/FiraCode](FiraCode)                                       | Free monospaced font with programming ligatures                                                                 |
| [https://github.com/universal-ctags/ctags](ctags/ctags)                              | A maintained ctags implementation (vim-gutentags)                                                               |

### Python3

```bash
python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
```

#### Python2 (backwards compatibility)

```bash
python2 -m pip install pynvim
```

| Package                                                                                                 | Description                                                                                                                                  |
|---------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| [https://github.com/neovim/pynvim](pynvim)                                                              | support for python plugins in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API.   |
| [https://github.com/regen100/cmake-language-server](cmake-language-server)                              | CMake LSP Implementation                                                                                                                     |
| [https://pypi.org/project/black-but-with-tabs-instead-of-spaces](black-but-with-tabs-instead-of-spaces) | Black is the uncompromising Python code formatter. (BECAUSE TABS RULE OVER SPACES FIGHT ME.)                                                 |
| [https://pypi.org/project/cmakelang](cmakelang)                                                         | The cmake-format project provides Quality Assurance (QA) tools for cmake                                                                     |


### Node

```bash
yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted
```

| Package                                                                                                                                | Description                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------|-:----------------------------------------------------------------------------------------------------------------:-|
| [https://github.com/bash-lsp/bash-language-server](bash-language-server)                                                               | Bash language server implementation based on Tree Sitter and its grammar for Bash with explainshell integration.   |
| [https://github.com/bmatcuk/stylelint-lsp](stylelint-lsp)                                                                              | A stylelint Language Server                                                                                        |
| [https://github.com/hrsh7th/vscode-langservers-extracted](vscode-langservers-extracted)                                                | HTML/CSS/JSON language servers extracted from vscode.                                                              |
| [https://github.com/iamcco/vim-language-server](vim-language-server)                                                                   | VImScript language server, LSP for vim script                                                                      |
| [https://github.com/microsoft/pyright](pyright)                                                                                        | Static type checker for Python                                                                                     |
| [https://github.com/redhat-developer/yaml-language-server](yaml-language-server)                                                       | Language Server for Yaml Files                                                                                     |
| [https://github.com/sveltejs/language-tools/tree/master/packages/language-server](language-tools/tree/master/packages/language-server) | A language server (implementing the language server protocol) for Svelte.                                          |
| [https://github.com/typescript-language-server/typescript-language-server](typescript-language-server)                                 | Language Server Protocol implementation for TypeScript wrapping tsserver. (also works with js, jsx, tsx)           |
| [https://yarnpkg.com/package/neovim](neovim)                                                                                           | Neovim client API and neovim remote plugin provider                                                                |


### Lua

```bash
sudo luarocks install --server=https://luarocks.org/dev luaformatter
```
| Package                                                | Description                       |
|--------------------------------------------------------|-:-------------------------------:-|
| [https://github.com/Koihik/LuaFormatter](LuaFormatter) | Reformats your Lua source code.   |

## Plugins

| Plugin                                                                                       | Description                                                                                                                                                  |
| -------------------------------------------------------------------------------------------- | -:--------------------------------------------------------------------------------------------------------------------------------------------------------:- |
| [https://github.com/Iron-E/nvim-libmodal](nvim-libmodal)                                     | Create new "modes" for Neovim!                                                                                                                               |
| [https://github.com/Pocco81/dap-buddy.nvim](dap-buddy.nvim)                                | A NeoVim plugin for managing several debuggers for Nvim-dap.                                                                                                 |
| [https://github.com/RishabhRD/nvim-lsputils](nvim-lsputils)                                  | Better defaults for nvim-lsp actions                                                                                                                         |
| [https://github.com/RishabhRD/popfix](popfix)                                                | Neovim lua API for highly extensible quickfix window. (nvim-lsputils)                                                                                        |
| [https://github.com/Shatur/neovim-cmake](neovim-cmake)                                       | CMake integration for Neovim                                                                                                                                 |
| [https://github.com/Shougo/echodoc.vim](echodoc.vim)                                         | Displays function signatures from completions in the command line.                                                                                           |
| [https://github.com/Yggdroot/indentLine](indentLine)                                         | A vim plugin to display the indention levels with thin vertical lines                                                                                        |
| [https://github.com/airblade/vim-gitgutter](vim-gitgutter)                                   | A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.                                             |
| [https://github.com/akinsho/bufferline.nvim](bufferline.nvim)                                | A snazzy nail care buffer line (with minimal tab integration) for Neovim built using lua.                                                                    |
| [https://github.com/andweeb/presence.nvim](presence.nvim)                                    | Discord Rich Presence for Neovim                                                                                                                             |
| [https://github.com/andymass/vim-matchup](vim-matchup)                                       | highlight, navigate & operate on sets of matching text. It extends vim's % key to language-specific words instead of just single characters.                 |
| [https://github.com/antoinemadec/FixCursorHold.nvim](FixCursorHold.nvim)                     | Fix CursorHold Performance.                                                                                                                                  |
| [https://github.com/ap/vim-css-color](vim-css-color)                                         | Preview colours in source code while editing                                                                                                                 |
| [https://github.com/bazelbuild/vim-bazel](vim-bazel)                                         | Vim support for Bazel                                                                                                                                        |
| [https://github.com/bfredl/nvim-luadev](nvim-luadev)                                         | REPL/debug console for nvim lua plugins                                                                                                                      |
| [https://github.com/chaoren/vim-wordmotion](vim-wordmotion)                                  | More useful word motions for Vim                                                                                                                             |
| [https://github.com/dbeniamine/cheat.sh-vim](cheat.sh-vim)                                   | This is a highly configurable vim plugin to browse cheat sheet from cheat.sh directly from vim.                                                              |
| [https://github.com/dhruvasagar/vim-table-mode](vim-table-mode)                              | VIM Table Mode for instant table creation.                                                                                                                   |
| [https://github.com/easymotion/vim-easymotion](vim-easymotion)                               | It takes the (int) out of (int)w or (int)f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target.      |
| [https://github.com/elkowar/yuck.vim](yuck.vim)                                              | Vim filetype support for the new eww configuration language yuck.                                                                                            |
| [https://github.com/folke/todo-comments.nvim](todo-comments.nvim)                            | Highlight, list and search todo comments in your projects.                                                                                                   |
| [https://github.com/folke/which-key.nvim](which-key.nvim)                                    | lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.                                                 |
| [https://github.com/github/copilot.vim/](copilot.vim/)                                       | Neovim plugin for GitHub Copilot                                                                                                                             |
| [https://github.com/glacambre/firenvim](firenvim)                                            | Embed Neovim in your browser.                                                                                                                                |
| [https://github.com/glepnir/dashboard-nvim](dashboard-nvim)                                  | vim dashboard                                                                                                                                                |
| [https://github.com/google/vim-glaive](vim-glaive)                                           | Glaive is a utility for configuring maktaba plugins.(vim-bazel, vim-maktaba)                                                                                 |
| [https://github.com/google/vim-maktaba](vim-maktaba)                                         | Consistent Vimscript (vim-bazel)                                                                                                                             |
| [https://github.com/habamax/vim-godot](vim-godot)                                            | Use vim and godot engine to make games                                                                                                                       |
| [https://github.com/haya14busa/incsearch-easymotion.vim](incsearch-easymotion.vim)           | Integration between haya14busa/incsearch.vim and easymotion/vim-easymotion                                                                                   |
| [https://github.com/haya14busa/incsearch-fuzzy.vim](incsearch-fuzzy.vim)                     | incremantal fuzzy search extension for incsearch.vim                                                                                                         |
| [https://github.com/haya14busa/incsearch.vim](incsearch.vim)                                 | Improved incremental searching for Vim                                                                                                                       |
| [https://github.com/hoob3rt/lualine.nvim](lualine.nvim)                                      | A blazing fast and easy to configure neovim statusline plugin written in pure lua.                                                                           |
| [https://github.com/hoob3rt/lualine.nvim](lualine.nvim)                                      | A blazing fast and easy to configure neovim statusline written in pure lua.                                                                                  |
| [https://github.com/hrsh7th/nvim-cmp](nvim-cmp)                                              | Auto completion Lua plugin for nvim                                                                                                                          |
| [https://github.com/hrsh7th/vim-vsnip](vim-vsnip)                                            | Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.                                                                                       |
| [https://github.com/itchyny/vim-cursorword](vim-cursorword)                                  | Underlines the word under the cursor                                                                                                                         |
| [https://github.com/jackguo380/vim-lsp-cxx-highlight](vim-lsp-cxx-highlight)                 | Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd                                                                                |
| [https://github.com/jbyuki/one-small-step-for-vimkind](one-small-step-for-vimkind)           | Debug adapter for Neovim plugins                                                                                                                             |
| [https://github.com/jeffkreeftmeijer/vim-numbertoggle](vim-numbertoggle)                     | Toggles between hybrid and absolute line numbers automatically                                                                                               |
| [https://github.com/junegunn/vim-easy-align](vim-easy-align)                                 | A simple, easy-to-use Vim alignment plugin.                                                                                                                  |
| [https://github.com/kkoomen/vim-doge](vim-doge)                                              | (Do)cumentation (Ge)nerator 10+ languages books Generate proper code documentation skeletons with a single keypress. zapfire                                 |
| [https://github.com/kyazdani42/nvim-tree.lua](nvim-tree.lua)                                 | A file explorer tree for neovim written in lua                                                                                                               |
| [https://github.com/kyazdani42/nvim-web-devicons](nvim-web-devicons)                         | A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.                                                             |
| [https://github.com/lewis6991/impatient.nvim](impatient.nvim)                                | Improve startup time for Neovim                                                                                                                              |
| [https://github.com/liuchengxu/vista.vim](vista.vim)                                         | View and search LSP symbols, tags in Vim/NeoVim.                                                                                                             |
| [https://github.com/ludovicchabant/vim-gutentags](vim-gutentags)                             | management of tags files in. (re)generate tag files as you work. It will even do its best to keep those tag files out of your way too.                       |
| [https://github.com/lukas-reineke/headlines.nvim](headlines.nvim)                            | This plugin adds 3 kind of horizontal highlights for text filetypes, like `markdown`, `vimwiki` and `orgmode`                                                |
| [https://github.com/luochen1990/rainbow](rainbow)                                            | Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.                                                         |
| [https://github.com/marko-cerovac/material.nvim](material.nvim)                              | Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins                                        |
| [https://github.com/mfussenegger/nvim-dap](nvim-dap)                                         | Debug Adapter Protocol client implementation for Neovim (>= 0.5)                                                                                             |
| [https://github.com/mg979/vim-visual-multi](vim-visual-multi)                                | Multiple cursors plugin for vim/neovim                                                                                                                       |
| [https://github.com/michaelb/sniprun](sniprun)                                               | A neovim plugin to run lines/blocs of code (independently of the rest of the file), supporting multiples languages                                           |
| [https://github.com/neoclide/jsonc.vim](jsonc.vim)                                           | jsonc syntax support for vim (Pending)                                                                                                                       |
| [https://github.com/neovim/nvim-lspconfig](nvim-lspconfig)                                   | Quickstart configurations for the Nvim LSP client                                                                                                            |
| [https://github.com/nvim-lua/plenary.nvim](plenary.nvim)                                     | plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. (telescope)                                       |
| [https://github.com/nvim-lua/popup.nvim](popup.nvim)                                         | [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete(telescope)                                                       |
| [https://github.com/nvim-telescope/telescope-dap.nvim](telescope-dap.nvim)                   | Integration for nvim-dap with telescope.nvim                                                                                                                 |
| [https://github.com/nvim-telescope/telescope-github.nvim](telescope-github.nvim)             | Integration with github cli (telescope)                                                                                                                      |
| [https://github.com/nvim-telescope/telescope-media-files.nvim](telescope-media-files.nvim)   | Telescope extension to preview media files using Ueberzug. (telescope)                                                                                       |
| [https://github.com/nvim-telescope/telescope.nvim](telescope.nvim)                           | highly extendable fuzzy finder over lists. Telescope is centered around modularity, allowing for easy customization.                                         |
| [https://github.com/nvim-treesitter/nvim-treesitter](nvim-treesitter)                        | Provides a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it:      |
| [https://github.com/onsails/lspkind-nvim](lspkind-nvim)                                      | vscode-like pictograms for neovim lsp completion items                                                                                                       |
| [https://github.com/petrbroz/vim-glsl](vim-glsl)                                             | syntax highlighting or code folding for standard OpenGL ES 1.0 shaders, and for additional directives used in three.js (for example, #include).              |
| [https://github.com/preservim/nerdcommenter](nerdcommenter)                                  | Comment functions so powerful—no comment necessary.                                                                                                          |
| [https://github.com/rcarriga/nvim-dap-ui](nvim-dap-ui)                                       | A UI for nvim-dap                                                                                                                                            |
| [https://github.com/rcarriga/nvim-notify](nvim-notify)                                       | A fancy, configurable, notification manager for NeoVim                                                                                                       |
| [https://github.com/romainl/vim-cool](vim-cool)                                              | Vim-cool disables search highlighting when you are done searching and re-enables it when you search again                                                    |
| [https://github.com/sbdchd/neoformat](neoformat)                                             | sparkles A (Neo)vim plugin for formatting code.                                                                                                              |
| [https://github.com/simnalamburt/vim-mundo](vim-mundo)                                       | Graph your Vim undo tree in style.                                                                                                                           |
| [https://github.com/skywind3000/asyncrun.vim](asyncrun.vim)                                  | rocket Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!                                                                     |
| [https://github.com/sudormrfbin/cheatsheet.nvim](cheatsheet.nvim)                            | cheatsheet for nvim using Telescope. command autofill, bundled cheats for the editor, plugins, nerd-fonts, etc because hoomans suck at remembering stuff:    |
| [https://github.com/theHamsta/nvim-dap-virtual-text](nvim-dap-virtual-text)                  | This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.                                                     |
| [https://github.com/tikhomirov/vim-glsl](vim-glsl)                                           | Vim syntax highlighting for OpenGL Shading Language                                                                                                          |
| [https://github.com/tpope/vim-fugitive](vim-fugitive)                                        | A Git wrapper so awesome, it should be illegal                                                                                                               |
| [https://github.com/tpope/vim-repeat](vim-repeat)                                            | repeat.vim: enable repeating supported plugin maps with "."                                                                                                  |
| [https://github.com/tpope/vim-speeddating](vim-speeddating)                                  | use CTRL-A/CTRL-X to increment dates, times, and more                                                                                                        |
| [https://github.com/tpope/vim-surround](vim-surround)                                        | parentheses,brackets,quotes,XML tags, and more. mappings to easily delete, change and add such surroundings in pairs.                                        |
| [https://github.com/voldikss/vim-floaterm](vim-floaterm)                                     | star2 Terminal manager for (neo)vim                                                                                                                          |
| [https://github.com/wakatime/wakatime](wakatime)                                             | wakatime for progress tracking                                                                                                                               |
| [https://github.com/wbthomason/packer.nvim](packer.nvim)                                     | use-package inspired plugin manager for nvim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config             |
| [https://github.com/windwp/nvim-autopairs](nvim-autopairs)                                   | autopairs for neovim written by lua                                                                                                                          |
