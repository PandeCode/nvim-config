vim.g.coc_explorer_global_presets = {
    [".vim"] = {
        ["root-uri"] = "~/.config/nvim"
    },
    cocConfig = {
        ["root-uri"] = "~/.config/nvim"
    },
    tab = {
        position = "tab",
        ["quit-on-open"] = true
    },
    ["tab=$"] = {
        position = "tab=$",
        ["quit-on-open"] = true
    },
    floating = {
        position = "floating",
        ["open-action-strategy"] = "sourceWindow"
    },
    floatingTop = {
        position = "floating",
        ["floating-position"] = "center-top",
        ["open-action-strategy"] = "sourceWindow"
    },
    floatingLeftside = {
        position = "floating",
        ["floating-position"] = "left-center",
        ["floating-width"] = 50,
        ["open-action-strategy"] = "sourceWindow"
    },
    floatingRightside = {
        position = "floating",
        ["floating-position"] = "right-center",
        ["floating-width"] = 50,
        ["open-action-strategy"] = "sourceWindow"
    },
    simplify = {
        ["file-child-template"] = "[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]"
    },
    buffer = {
        sources = {{name = "buffer", expand = true}}
    }
}

vim.g.netrw_bufsettings = "nohidden noma nomod nonu nowrap ro buflisted"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
source $HOME/.config/nvim/vimscript/plugins/explorer.vim
]])
