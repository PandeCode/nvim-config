local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute "packadd packer.nvim"
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function()
        -- Syntax highlighting and Completion
        use {
            "neoclide/coc.nvim",
            branch = "master",
            run = "yarn install --frozen-lockfile"
        }

        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Simple plugins can be specified as strings
        use "9mm/vim-closer"

        -- Lazy loading:
        -- Load on specific commands
        use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

        -- Load on an autocommand event
        use {"andymass/vim-matchup", event = "VimEnter"}

        -- You can specify rocks in isolation
        use_rocks "penlight"
        use_rocks {"lua-resty-http", "lpeg"}

        -- Plugins can have post-install/update hooks
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install",
            cmd = "MarkdownPreview",
            ft = {"markdowm", "md"}
        }

        -- Language defaults for syntax highlighting and other basic stuff
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        -- Theme
        use {"dracula/vim", as = "dracula"}

        use "sudormrfbin/cheatsheet.nvim"

        use "easymotion/vim-easymotion"

        use "Shougo/echodoc.vim"

        use "kana/vim-textobj-user"
        use "preservim/nerdcommenter"
        use "glts/vim-textobj-comment"

        -- Select multiple sections of code
        use {"mg979/vim-visual-multi", branch = "master"}

        -- Icons
        use "ryanoasis/vim-devicons"
        use "kyazdani42/nvim-web-devicons"

        -- Welcome Page
        use "glepnir/dashboard-nvim"

        -- Statusline
        use "itchyny/lightline.vim"

        -- Show file layout of functions and varibles and other symbols
        use "liuchengxu/vista.vim"

        -- Cool Tabline
        use "romgrk/barbar.nvim"

        -- Much needed tags file management making file searches exponentially faster
        use "ludovicchabant/vim-gutentags"

        -- Better search
        use "haya14busa/incsearch.vim"
        use "haya14busa/incsearch-fuzzy.vim"
        use "haya14busa/incsearch-easymotion.vim"

        -- Git
        use "airblade/vim-gitgutter"
        use "tpope/vim-fugitive"

        -- Flutter
        use {"dart-lang/dart-vim-plugin", ft = {"dart", "flutter"}}

        -- Golang
        use {"fatih/vim-go", ft = {"go", "golang"}}

        -- Rustlang
        use {"rust-lang/rust.vim", ft = {"rust", "cargo"}}

        --use 'OmniSharp/omnisharp-vim'
        --use 'nickspoons/vim-sharpenup'

        -- Highlight current word under the cursor in the whole file
        use "itchyny/vim-cursorword"

        -- Speed things up
        use "antoinemadec/FixCursorHold.nvim"

        -- Get a floating terminal
        use "voldikss/vim-floaterm"

        -- CMake Build System Support
        use {"cdelledonne/vim-cmake", ft = {"cpp", "c", "cmake"}}

        -- Json with comments support
        use {"neoclide/jsonc.vim", ft = {"json", "jsonc"}}

        --Undo tree
        use "sjl/gundo.vim"

        --Reading Documents
        use "Konfekt/vim-office"

        -- Making Documentation
        use {
            "kkoomen/vim-doge",
            cmd = {},
            ft = {
                "cpp",
                "c",
                "java",
                "python",
                "javascript",
                "typescript",
                "typescriptreact",
                "javascriptreact",
                "bash",
                "ruby",
                "php",
                "rust",
                "groovy"
            }
        }

        -- Debugging support
        use {
            "puremourning/vimspector",
            ft = {"cpp", "c", "rust", "javascript", "javascriptreact", "typescript", "typescriptreact", "python"}
        }

        -- Rainbow Brackets
        use "luochen1990/rainbow"

        -- Indent Guide if spaces are used
        use "Yggdroot/indentLine"

        -- Bazel Support
        use {"google/vim-maktaba", ft = {"bzl", "bazel"}}
        use {"google/vim-glaive", ft = {"bzl", "bazel"}}
        use {"bazelbuild/vim-bazel", ft = {"bzl", "bazel"}}

        -- Code Formatting
        use "sbdchd/neoformat"

        -- Gdscript
        use {"habamax/vim-godot", ft = {"gdscript"}}

        -- A simple, easy-to-use Vim alignment plugin.
        use "junegunn/vim-easy-align"

        --Fix bad vim word movements eg= CamelCaseACRONYMWords_underscore1234
        use "chaoren/vim-wordmotion"

        -- Number toggle
        use "jeffkreeftmeijer/vim-numbertoggle"

        -- Telescope
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope.nvim"
        use "fannheyward/telescope-coc.nvim"
        use "fhill2/telescope-ultisnips.nvim"
        use "nvim-telescope/telescope-node-modules.nvim"
        use "nvim-telescope/telescope-vimspector.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-telescope/telescope-github.nvim"

        -- Semantic Highlight
        use {"jackguo380/vim-lsp-cxx-highlight", ft = {"c", "cpp"}}

        -- Show the shortcuts in a popup
        use "folke/which-key.nvim"

        -- Repeat commands that are not native to vim like vim surround
        use "tpope/vim-repeat"

        -- Make brackets and other surrounding stuff
        use "tpope/vim-surround"

        -- Let <C-A> or in my case <C-I> play nice with dates 2000-08-29 =help speeddating
        use "tpope/vim-speeddating"

        -- GLSL Support
        use "tikhomirov/vim-glsl"
    end
)
