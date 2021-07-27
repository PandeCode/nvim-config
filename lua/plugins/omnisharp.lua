vim.cmd(
    [[
" Sharpenup: {{{

augroup OmniSharpIntegrations
		autocmd!
		autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}
]]
)

-- All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
-- :OmniSharpGotoDefinition
vim.g.sharpenup_map_prefix = "<Space>os"
vim.g.sharpenup_statusline_opts = {Text = "%s (%p/%P)"}
vim.g.sharpenup_statusline_opts.Highlight = 1

vim.g.OmniSharp_popup_position = "peek"
vim.g.OmniSharp_popup_options = {
    winhl = "Normal=NormalFloat"
}
vim.g.OmniSharp_popup_options = {
    highlight = "Normal",
    padding = {0, 0, 0, 0},
    border = {1}
}
vim.g.OmniSharp_popup_mappings = {
    sigNext = "<C-n>",
    sigPrev = "<C-p>",
    pageDown = {"<C-f>", "<PageDown>"},
    pageUp = {"<C-b>", "<PageUp>"}
}

vim.g.OmniSharp_want_snippet = 1
vim.g.OmniSharp_highlight_groups = {
    ExcludedCode = "NonText"
}
