# nvim-config

Neovim config files.

# Table of Contents

-   [nvim-config](#nvim-config)
    -   [Packages](#packages)
        -   [Native](#native)
        -   [Python3](#python3)
            -   [Python2 (backwards compatibility)](#python2-backwards-compatibility)
        -   [Node](#node)
        -   [Lua](#lua)
    -   [Plugins](#plugins)

## Packages

### Native

```bash
sudo yay -S clang cmake ccls ripgrep ttf-fira-code ctags ueberzug ffmpegthumbnailer poppler fontpreview fmui-git shfmt glsl-language-server
```

<table>
	<tr>
		<th>Package</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>https://github.com/freedesktop/poppler</td>
		<td>This is Poppler, a library for rendering PDF files, and examining or modifying their structure. Poppler originally came from the XPDF sources; please see the file README-XPDF for the original xpdf-3.03 README. (vim-office)</td>
	</tr>
	<tr>
		<td>https://github.com/sdushantha/fontpreview</td>
		<td> Highly customizable and minimal font previewer written in bash (telescope font preview)</td>
	</tr>
	<tr>
		<td>https://github.com/tmknom/shfmt</td>
		<td>Dockernized shfmt. This formats shell script.</td>
	</tr>
	<tr>
		<td>https://github.com/svenstaro/glsl-language-server</td>
		<td>Language server implementation for GLSL (Pending)</td>
	</tr>
	<tr>
		<td>https://github.com/tonsky/FiraCode</td>
		<td>Free monospaced font with programming ligatures</td>
	</tr>
	<tr>
		<td>https://github.com/universal-ctags/ctags</td>
		<td>A maintained ctags implementation (vim-gutentags)</td>
	</tr>
	<tr>
		<td>https://github.com/seebye/ueberzug</td>
		<td>ueberzug is a command line util which allows to display images in combination with X11</td>
	</tr>
	<tr>
		<td>https://github.com/dirkvdb/ffmpegthumbnailer</td>
		<td>Lightweight video thumbnailer that can be used by file managers to create thumbnails for video files (telescope preview)</td>
	</tr>
	<tr>
		<td>https://github.com/BurntSushi/ripgrep</td>
		<td>ripgrep recursively searches directories for a regex pattern while respecting your gitignore</td>
	</tr>
	<tr>
		<td>https://github.com/Kitware/CMake</td>
		<td> CMake is a cross-platform, open-source build system generator.  For full documentation visit the https://cmake.org and the https://cmake.org/documentation. The https://gitlab.kitware.com/cmake/community/-/wikis/home also references useful guides and recipes.</td>
    </tr>

</table>

### Python3

```bash
python3 -m pip install pynvim cmakelang cmake-language-server black-but-with-tabs-instead-of-spaces
```

#### Python2 (backwards compatibility)

```bash
python2 -m pip install pynvim
```

<table>
	<tr>
		<th>Package</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>https://github.com/neovim/pynvim</td>
		<td>Pynvim implements support for python plugins in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API.</td>
	</tr>
	<tr>
		<td>https://pypi.org/project/cmakelang</td>
		<td>The cmake-format project provides Quality Assurance (QA) tools for cmake</td>
	</tr>
	<tr>
		<td>https://github.com/regen100/cmake-language-server</td>
		<td>CMake LSP Implementation </td>
	</tr>
	<tr>
		<td>https://pypi.org/project/black-but-with-tabs-instead-of-spaces</td>
		<td>Black is the uncompromising Python code formatter. By using it, you agree to cede control over minutiae of hand-formatting. In return, Black gives you speed, determinism, and freedom from pycodestyle nagging about formatting. You will save time and mental energy for more important matters. (BECAUSE TABS RULE OVER SPACES FIGHT ME.)(but you can just install the normal black because they both add the same named binary)</td>
	    </tr>
</table>

### Node

```bash
yarn global add neovim pyright stylelint-lsp svelte-language-server typescript-language-server bash-language-server vim-language-server yaml-language-server vscode-langservers-extracted
```

<table>
	<tr>
		<th>Package</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>https://github.com/sveltejs/language-tools/tree/master/packages/language-server</td>
		<td>A language server (implementing the language server protocol) for Svelte.</td>
	</tr>
	<tr>
		<td>https://github.com/microsoft/pyright</td>
		<td>Static type checker for Python</td>
	</tr>
	<tr>
		<td>https://github.com/bash-lsp/bash-language-server</td>
		<td>Bash language server implementation based on Tree Sitter and its grammar for Bash with explainshell integration.</td>
	</tr>
	<tr>
		<td>https://github.com/bmatcuk/stylelint-lsp</td>
		<td>A stylelint Language Server</td>
	</tr>
	<tr>
		<td>https://github.com/typescript-language-server/typescript-language-server</td>
		<td>Language Server Protocol implementation for TypeScript wrapping tsserver. (also works with js, jsx, tsx)</td>
	</tr>
	<tr>
		<td>https://yarnpkg.com/package/neovim</td>
		<td>Neovim client API and neovim remote plugin provider</td>
	</tr>
    <tr>
    	<td>https://github.com/iamcco/vim-language-server</td>
    	<td>VImScript language server, LSP for vim script</td>
    </tr>
    <tr>
    	<td>https://github.com/hrsh7th/vscode-langservers-extracted</td>
    	<td>HTML/CSS/JSON language servers extracted from vscode.</td>
    </tr>
    <tr>
    	<td>https://github.com/redhat-developer/yaml-language-server</td>
    	<td>Language Server for Yaml Files</td>
    </tr>
</table>

### Lua

```bash
sudo luarocks install --server=https://luarocks.org/dev luaformatter
```

<table>
	<tr>
		<th>Package</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>https://github.com/Koihik/LuaFormatter</td>
		<td>Reformats your Lua source code.</td>
	</tr>
</table>

## Plugins

<table>
  <tr>
    <th>Plugin</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>https://github.com/wbthomason/packer.nvim</td>
    <td>A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config</td>
  </tr>
   <tr>
    <td>https://github.com/andymass/vim-matchup</td>
    <td>
      match-up is a plugin that lets you highlight, navigate, and operate on
      sets of matching text. It extends vim's % key to language-specific words
      instead of just single characters.
    </td>
  </tr>
  <tr>
    <td>https://github.com/nvim-treesitter/nvim-treesitter</td>
    <td>
      The goal of nvim-treesitter is both to provide a simple and easy way to
      use the interface for tree-sitter in Neovim and to provide some basic
      functionality such as highlighting based on it:
    </td>
  </tr>
  <tr>
    <td>https://github.com/marko-cerovac/material.nvim</td>
    <td>trident Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins
</td>
  </tr>
  <tr>
    <td>https://github.com/sudormrfbin/cheatsheet.nvim</td>
    <td>
      A searchable cheatsheet for neovim from within the editor using Telescope
      (fallback to displaying in a floating window if Telescope is not
      installed) with command autofill, bundled cheats for the editor, vim
      plugins, nerd-fonts, etc because hoomans suck at remembering stuff:
    </td>
  </tr>
  <tr>
    <td>https://github.com/easymotion/vim-easymotion</td>
    <td>
      EasyMotion provides a much simpler way to use some motions in vim. It
      takes the ( number ) out of ( number )w or ( number )f{char} by
      highlighting all possible choices and allowing you to press one key to
      jump directly to the target.
    </td>
  </tr>
  <tr>
    <td>https://github.com/preservim/nerdcommenter</td>
    <td>Comment functions so powerful—no comment necessary.</td>
  </tr>
  <tr>
    <td>https://github.com/mg979/vim-visual-multi</td>
    <td>Multiple cursors plugin for vim/neovim</td>
  </tr>
  <tr>
    <td>https://github.com/kyazdani42/nvim-web-devicons</td>
    <td>
      A lua fork of vim-devicons. This plugin provides the same icons as well as
      colors for each icon.
    </td>
  </tr>
  <tr>
    <td>https://github.com/glepnir/dashboard-nvim</td>
    <td>vim dashboard</td>
  </tr>
  <tr>
    <td>https://github.com/romainl/vim-cool</td>
    <td>
      Vim-cool disables search highlighting when you are done searching and
      re-enables it when you search again
    </td>
  </tr>
  <tr>
    <td>https://github.com/Shougo/echodoc.vim</td>
    <td>Displays function signatures from completions in the command line.</td>
  </tr>
  <tr>
    <td>https://github.com/hoob3rt/lualine.nvim</td>
    <td>
      A blazing fast and easy to configure neovim statusline written in pure
      lua.
    </td>
  </tr>
  <tr>
    <td>https://github.com/liuchengxu/vista.vim</td>
    <td>View and search LSP symbols, tags in Vim/NeoVim.</td>
  </tr>
  <tr>
    <td>https://github.com/akinsho/nvim-bufferline.lua</td>
    <td>A snazzy nail_care buffer line (with minimal tab integration) for Neovim built using lua.</td>
  </tr>
  <tr>
    <td>https://github.com/ludovicchabant/vim-gutentags</td>
    <td>
      Gutentags is a plugin that takes care of the much needed management of
      tags files in Vim. It will (re)generate tag files as you work while
      staying completely out of your way. It will even do its best to keep those
      tag files out of your way too. It has no dependencies and just works.
    </td>
  </tr>
  <tr>
    <td>https://github.com/tpope/vim-surround</td>
    <td>
      Surround.vim is all about "surroundings": parentheses, brackets, quotes,
      XML tags, and more. The plugin provides mappings to easily delete, change
      and add such surroundings in pairs.
    </td>
  </tr>
  <tr>
    <td>https://github.com/tpope/vim-repeat</td>
    <td>repeat.vim: enable repeating supported plugin maps with "."</td>
  </tr>
  <tr>
    <td>https://github.com/glacambre/firenvim</td>
    <td>Embed Neovim in your browser.</td>
  </tr>
  <tr>
    <td>https://github.com/petrbroz/vim-glsl</td>
    <td>
      Provides basic functionality such as syntax highlighting or code folding
      for standard OpenGL ES 1.0 shaders, and for additional directives used in
      three.js (for example, #include).
    </td>
  </tr>
  <tr>
    <td>https://github.com/tikhomirov/vim-glsl</td>
    <td>Vim syntax highlighting for OpenGL Shading Language</td>
  </tr>
  <tr>
    <td>https://github.com/tpope/vim-speeddating</td>
    <td>
      speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
    </td>
  </tr>
  <tr>
    <td>https://github.com/folke/which-key.nvim</td>
    <td>
      boom Create key bindings that stick. WhichKey is a lua plugin for Neovim
      0.5 that displays a popup with possible keybindings of the command you
      started typing.
    </td>
  </tr>
  <tr>
    <td>https://github.com/jackguo380/vim-lsp-cxx-highlight</td>
    <td>
      Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or
      clangd
    </td>
  </tr>
  <tr>
    <td>https://github.com/jeffkreeftmeijer/vim-numbertoggle</td>
    <td>Toggles between hybrid and absolute line numbers automatically</td>
  </tr>
  <tr>
    <td>https://github.com/chaoren/vim-wordmotion</td>
    <td>More useful word motions for Vim</td>
  </tr>
  <tr>
    <td>https://github.com/junegunn/vim-easy-align</td>
    <td>A simple, easy-to-use Vim alignment plugin.</td>
  </tr>
  <tr>
    <td>https://github.com/habamax/vim-godot</td>
    <td>Use vim and godot engine to make games</td>
  </tr>
  <tr>
    <td>https://github.com/airblade/vim-gitgutter</td>
    <td>
      A Vim plugin which shows git diff markers in the sign column and
      stages/previews/undoes hunks and partial hunks.
    </td>
  </tr>
  <tr>
    <td>https://github.com/haya14busa/incsearch.vim</td>
    <td>Improved incremental searching for Vim</td>
  </tr>
  <tr>
    <td>https://github.com/haya14busa/incsearch-fuzzy.vim</td>
    <td>incremantal fuzzy search extension for incsearch.vim</td>
  </tr>
  <tr>
    <td>https://github.com/haya14busa/incsearch-easymotion.vim</td>
    <td>
      Integration between haya14busa/incsearch.vim and easymotion/vim-easymotion
    </td>
  </tr>
  <tr>
    <td>https://github.com/sbdchd/neoformat</td>
    <td>sparkles A (Neo)vim plugin for formatting code.</td>
  </tr>
  <tr>
    <td>https://github.com/google/vim-maktaba</td>
    <td>Consistent Vimscript (vim-bazel)</td>
  </tr>
  <tr>
    <td>https://github.com/google/vim-glaive</td>
    <td>
      Glaive is a utility for configuring maktaba plugins.(vim-bazel,
      vim-maktaba)
    </td>
  </tr>
  <tr>
    <td>https://github.com/bazelbuild/vim-bazel</td>
    <td>Vim support for Bazel</td>
  </tr>
  <tr>
    <td>https://github.com/Yggdroot/indentLine</td>
    <td>
      A vim plugin to display the indention levels with thin vertical lines
    </td>
  </tr>
  <tr>
    <td>https://github.com/luochen1990/rainbow</td>
    <td>
      Rainbow Parentheses Improved, shorter code, no level limit, smooth and
      fast, powerful configuration.
    </td>
  </tr>
  <tr>
    <td>https://github.com/puremourning/vimspector</td>
    <td>vimspector - A multi-language debugging system for Vim</td>
  </tr>
  <tr>
    <td>https://github.com/kkoomen/vim-doge</td>
    <td>
      (Do)cumentation (Ge)nerator 10+ languages books Generate proper code
      documentation skeletons with a single keypress. zapfire
    </td>
  </tr>
  <tr>
    <td>https://github.com/neoclide/jsonc.vim</td>
    <td>jsonc syntax support for vim (Pending)</td>
  </tr>
  <tr>
    <td>https://github.com/voldikss/vim-floaterm</td>
    <td>star2 Terminal manager for (neo)vim</td>
  </tr>
  <tr>
    <td>https://github.com/antoinemadec/FixCursorHold.nvim</td>
    <td>Fix CursorHold Performance.</td>
  </tr>
  <tr>
    <td>https://github.com/itchyny/vim-cursorword</td>
    <td>Underlines the word under the cursor</td>
  </tr>
  <tr>
    <td>https://github.com/tpope/vim-fugitive</td>
    <td>A Git wrapper so awesome, it should be illegal</td>
  </tr>
  <tr>
    <td>https://github.com/nvim-lua/plenary.nvim</td>
    <td>plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. (telescope)</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-lua/popup.nvim</td>
    <td>[WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete(telescope)</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-telescope/telescope.nvim</td>
    <td>telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-telescope/telescope-node-modules.nvim</td>
    <td>An extension that provides its users with node packages under node_modules directory (telescope)</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-telescope/telescope-vimspector.nvim</td>
    <td>Integration for vimspector with telescope.nvim (telescope)</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-telescope/telescope-media-files.nvim</td>
    <td>Telescope extension to preview media files using Ueberzug. (telescope)</td>
  </tr>  
  <tr>
    <td>https://github.com/nvim-telescope/telescope-github.nvim</td>
    <td>Integration with github cli (telescope)</td>
  </tr>

  <tr>
    <td>https://github.com/neovim/nvim-lspconfig</td>
    <td>Quickstart configurations for the Nvim LSP client</td>
  </tr>
  <tr>
    <td>https://github.com/hrsh7th/nvim-compe</td>
    <td>Auto completion Lua plugin for nvim</td>
  </tr>

  <tr>
    <td>https://github.com/onsails/lspkind-nvim</td>
    <td>vscode-like pictograms for neovim lsp completion items	</td>
  </tr>

  <tr>
    <td>https://github.com/windwp/nvim-autopairs</td>
    <td>autopairs for neovim written by lua</td>
  </tr>

  <tr>
    <td>https://github.com/hrsh7th/vim-vsnip</td>
    <td>Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.</td>
  </tr>

  <tr>
    <td>https://github.com/hoob3rt/lualine.nvim</td>
    <td>A blazing fast and easy to configure neovim statusline plugin written in pure lua.</td>
  </tr>

  <tr>
    <td>https://github.com/kyazdani42/nvim-tree.lua</td>
    <td>A file explorer tree for neovim written in lua</td>
  </tr>
 
  <tr>
    <td>https://github.com/RishabhRD/nvim-lsputils</td>
    <td>Better defaults for nvim-lsp actions</td>
  </tr>
  <tr>
    <td>https://github.com/RishabhRD/popfix</td>
    <td>Neovim lua API for highly extensible quickfix window. (nvim-lsputils)</td>
  </tr>

  <tr>
    <td>https://github.com/mfussenegger/nvim-dap</td>
    <td>Debug Adapter Protocol client implementation for Neovim (>= 0.5)</td>
  </tr>
  <tr>
	<td>https://github.com/skywind3000/asyncrun.vim<\td>
	<td>rocket Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window !!<\td>
  </tr>

  <tr>
<td>https://github.com/Shatur/neovim-cmake</td>
<td>CMake integration for Neovim</td>
  </tr>

 </table>
