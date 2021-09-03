local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute "packadd packer.nvim"
end

return require("packer").startup(
    function()
        -- Packer can manage itself

        use "wbthomason/packer.nvim"

        use "kyazdani42/nvim-web-devicons"

        use "antoinemadec/FixCursorHold.nvim"

        use "luochen1990/rainbow"
        use "Yggdroot/indentLine"

        use "folke/which-key.nvim"
        use "sudormrfbin/cheatsheet.nvim"

        use "dbeniamine/cheat.sh-vim"

        use {
            "glepnir/dashboard-nvim",
            config = function()
                require("config.dashboard")
            end
        }
        use {
            "akinsho/nvim-bufferline.lua",
            config = function()
                require("config.bufferline")
            end
        }

        use {
            "hoob3rt/lualine.nvim",
            config = function()
                require("config.lualineNvim")
            end
        }
        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("config.tree")
            end
        }
        use {
            "liuchengxu/vista.vim",
            config = function()
                require("config.vista")
            end
        }

        use "voldikss/vim-floaterm"

        use "haya14busa/incsearch.vim"
        use "haya14busa/incsearch-easymotion.vim"
        use "haya14busa/incsearch-fuzzy.vim"

        use {
            "google/vim-maktaba",
            ft = {"bzl", "bazel"}
        }
        use {
            "google/vim-glaive",
            ft = {"bzl", "bazel"}
        }
        use {
            "bazelbuild/vim-bazel",
            ft = {"bzl", "bazel"}
        }

        use {
            "habamax/vim-godot",
            ft = {"gdscript", "gdscript3"},
            config = function()
                require("config.godot")
            end
        }
        use {"neoclide/jsonc.vim", ft = {"json", "jsonc"}}

        use {
            "petrbroz/vim-glsl",
            as = "pgsls",
            ft = {"glsl", "hlsl", "vert", "frag"},
            requires = {{"tikhomirov/vim-glsl", opt = true}}
        }

        use {
            "Konfekt/vim-office",
            ft = {"docx", "pdf", "doc"},
            config = function()
                require("config.office")
            end
        }

        use {
            "marko-cerovac/material.nvim",
            config = function()
                require("config.theme")
            end
        }

        use {
            "simnalamburt/vim-mundo",
            config = function()
                require("config.mundo")
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("config.treesitter")
            end,
            ft = {
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "comment",
                "cpp",
                "css",
                "dart",
                "dockerfile",
                "fish",
                "gdscript",
                "go",
                "gomod",
                "graphql",
                "html",
                "java",
                "javascript",
                "javascriptreact",
                "js",
                "jsx",
                "jsdoc",
                "json5",
                "kotlin",
                "lua",
                "python",
                "regex",
                "rst",
                "ruby",
                "rust",
                "scss",
                "surface",
                "svelte",
                "teal",
                "toml",
                "ts",
                "tsx",
                "typescript",
                "typescriptreact",
                "javascript",
                "vimscript",
                "yaml"
            }
        }

        --use "sheerun/vim-polyglot"

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("lsp")
            end,
            requires = {
                "RishabhRD/popfix",
                "RishabhRD/nvim-lsputils"
            }
        }

        use {
            "onsails/lspkind-nvim",
            config = function()
                require("config.lspkind")
            end
        }
        use {
            "hrsh7th/vim-vsnip",
            config = function()
                require("config.vsnip")
            end
        }
        use {
            "hrsh7th/nvim-compe",
            config = function()
                require("config.compe")
            end
        }
        use {"andersevenrud/compe-tmux"}
        use {"Shougo/echodoc.vim"}

        use {
            "kkoomen/vim-doge",
            config = function()
                require("config.doge")
            end,
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

        use {
            "puremourning/vimspector",
            ft = {"cpp", "c", "rust", "javascript", "javascriptreact", "typescript", "typescriptreact", "python"},
            config = function()
                require("config.vimspector")
            end
        }

        use {
            "airblade/vim-gitgutter",
            "tpope/vim-fugitive"
        }

        use {"fhill2/telescope-ultisnips.nvim"}
        use {"nvim-telescope/telescope-node-modules.nvim"}
        use {"nvim-telescope/telescope-vimspector.nvim"}
        use {"nvim-telescope/telescope-media-files.nvim"}
        use {"nvim-telescope/telescope-github.nvim"}
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require("config.telescope")
            end
        }

        use {
            "andymass/vim-matchup",
            "chaoren/vim-wordmotion",
            "itchyny/vim-cursorword",
            "jeffkreeftmeijer/vim-numbertoggle",
            "junegunn/vim-easy-align",
            "mg979/vim-visual-multi",
            "romainl/vim-cool",
            "tpope/vim-repeat",
            "tpope/vim-speeddating",
            "tpope/vim-surround"
        }
        use {
            "easymotion/vim-easymotion",
            config = function()
                require("config.easymotion")
            end
        }
        use {
            "preservim/nerdcommenter",
            config = function()
                require("config.nerdcommenter")
            end
        }
        use {
            "sbdchd/neoformat",
            config = function()
                require("config.neoformat")
            end
        }

        use "ludovicchabant/vim-gutentags"
        use "mfussenegger/nvim-dap"
        use "skywind3000/asyncrun.vim"
        use {
            "Shatur/neovim-cmake",
            ft = {"c", "cpp", "cmake"},
            config = function()
                require("config.cmake")
            end,
            requires = {
                "nvim-telescope/telescope.nvim"
            }
        }

        use {
            "windwp/nvim-autopairs",
            config = function()
                require("config.autopairs")
            end
        }

        use {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim"
        }

        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end,
            config = function()
                require("config.firenvim")
            end
        }
    end
)

--use {
--'myusername/example',        -- The plugin location string
---- The following keys are all optional
--disable = boolean,           -- Mark a plugin as inactive
--as = string,                 -- Specifies an alias under which to install the plugin
--installer = function,        -- Specifies custom installer. See "custom installers" below.
--updater = function,          -- Specifies custom updater. See "custom installers" below.
--after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--opt = boolean,               -- Manually marks a plugin as optional.
--branch = string,             -- Specifies a git branch to use
--tag = string,                -- Specifies a git tag to use
--commit = string,             -- Specifies a git commit to use
--lock = boolean,              -- Skip this plugin in updates/syncs
--run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--config = string or function, -- Specifies code to run after this plugin is loaded.
---- The setup key implies opt = true
--setup = string or function,  -- Specifies code to run before this plugin is loaded.
---- The following keys all imply lazy-loading and imply opt = true
--cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--ft = string or list,         -- Specifies filetypes which load this plugin.
--keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--event = string or list,      -- Specifies autocommand events which load this plugin.
--fn = string or list          -- Specifies functions which load this plugin.
--cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
---- with one of these module names, the plugin will be loaded.
--module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--requiring a string which matches one of these patterns, the plugin will be loaded.
--}
