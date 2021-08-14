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
        use "hoob3rt/lualine.nvim"
        use "romainl/vim-cool"

        use "windwp/nvim-autopairs"

        use "preservim/nerdcommenter"

        use "kyazdani42/nvim-web-devicons"

        use "voldikss/vim-floaterm"
        use "romgrk/barbar.nvim"

        use "antoinemadec/FixCursorHold.nvim"

        use "sbdchd/neoformat"

        use "kyazdani42/nvim-tree.lua"

        use {
            "luochen1990/rainbow",
            "Yggdroot/indentLine"
        }

        use {
            "folke/which-key.nvim",
            "sudormrfbin/cheatsheet.nvim"
        }

        use {"Konfekt/vim-office", ft = {"docx", "pdf", "doc"}}

        use {"dracula/vim", as = "dracula"}

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use {
            "neovim/nvim-lspconfig",
            requires = {
                "onsails/lspkind-nvim",
                "hrsh7th/nvim-compe",
                "hrsh7th/vim-vsnip",
                "andersevenrud/compe-tmux"
            }
        }

        use {
            "kkoomen/vim-doge",
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
            ft = {"cpp", "c", "rust", "javascript", "javascriptreact", "typescript", "typescriptreact", "python"}
        }

        use {
            "airblade/vim-gitgutter",
            "tpope/vim-fugitive"
        }

        use {
            "tpope/vim-repeat",
            "tpope/vim-surround",
            "tpope/vim-speeddating",
            "junegunn/vim-easy-align",
            "chaoren/vim-wordmotion",
            "jeffkreeftmeijer/vim-numbertoggle",
            "andymass/vim-matchup",
            "easymotion/vim-easymotion",
            "mg979/vim-visual-multi",
            "itchyny/vim-cursorword"
        }

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "fhill2/telescope-ultisnips.nvim",
                "nvim-telescope/telescope-node-modules.nvim",
                "nvim-telescope/telescope-vimspector.nvim",
                "nvim-telescope/telescope-media-files.nvim",
                "nvim-telescope/telescope-github.nvim"
            }
        }

        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
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
