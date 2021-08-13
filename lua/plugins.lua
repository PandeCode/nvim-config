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
        use "preservim/nerdcommenter"

        use "kyazdani42/nvim-web-devicons"

        use "voldikss/vim-floaterm"
        use "romgrk/barbar.nvim"

        use "antoinemadec/FixCursorHold.nvim"

        use "luochen1990/rainbow"
        use "Yggdroot/indentLine"

        use "sbdchd/neoformat"

        use "folke/which-key.nvim"
        use "sudormrfbin/cheatsheet.nvim"

        use "sjl/gundo.vim"

        use "neovim/nvim-lspconfig"

        use {"Konfekt/vim-office", ft = {"docx", "pdf", "doc"}}

        use {"dracula/vim", as = "dracula"}

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

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
