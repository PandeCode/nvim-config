vim.cmd "source $HOME/.config/nvim/vimscript/config/vista.vim"

vim.g.vista_log_file = "/home/shawn/.cache/nvim/vista.log"
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_fzf_preview = {"right:50%"}
vim.g.vista_default_executive = "nvim_lsp"

vim.api.nvim_set_keymap(Keys.N, "<Space>gt", ":Vista!!<CR>", Keys.Noremap)
