vim.cmd "source $HOME/.config/nvim/vimscript/config/vista.vim"

vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_fzf_preview = {"right:50%"}
vim.g.vista_default_executive = "coc"

vim.g.vista = {
    renderer = {
        enable_icon = 1,
        icons = {
            variable = "",
            ["function"] = ""
        }
    }
}
