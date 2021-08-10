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

        use {"dracula/vim", as = "dracula"}


        use "andymass/vim-matchup"
        use "easymotion/vim-easymotion"
        use "mg979/vim-visual-multi"
        use "itchyny/vim-cursorword"
        use "antoinemadec/FixCursorHold.nvim"
        use "luochen1990/rainbow"
        use "Yggdroot/indentLine"
        use "sbdchd/neoformat"
        use "junegunn/vim-easy-align"
        use "chaoren/vim-wordmotion"
        use "jeffkreeftmeijer/vim-numbertoggle"
        use "folke/which-key.nvim"

        use "tpope/vim-repeat"
        use "tpope/vim-surround"
        use "tpope/vim-speeddating"

        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end
        }
    end
)
