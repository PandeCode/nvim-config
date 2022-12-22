vim.g.echodoc = vim.g.echodoc == nil and {} or vim.g.echodoc

-- -- Option 1:
-- -- To use echodoc, you must increase 'cmdheight' value.
-- vim.o.cmdheight = 2
-- vim.g.echodoc_enable_at_startup = 1

-- -- Option 2:
-- -- Or, you could disable showmode alltogether.
-- vim.o.noshowmode = true
-- vim.g.echodoc_enable_at_startup = 1

-- Option 3:
--  Or, you could use neovim's virtual virtual text feature.
vim.cmd [[let g:echodoc#enable_at_startup = 1]]
vim.cmd [[let g:echodoc#type = "virtual"]]

-- -- Option 4:
-- -- Or, you could use neovim's floating window feature.
-- vim.g.echodoc.enable_at_startup = 1
-- vim.g.echodoc.type = "floating"

-- -- You could configure the behaviour of the floating window like below:
-- vim.g.echodoc.floating_config = { border = "single" }
-- -- To use a custom highlight for the float window, change Pmenu to your highlight group
-- vim.cmd([[highlight link EchoDocFloat Pmenu]])

-- -- Option 5:
-- -- Or, you could use vim's popup window feature.
-- vim.g.echodoc.enable_at_startup = 1
-- vim.g.echodoc.type = "popup"
-- -- To use a custom highlight for the popup window change Pmenu to your highlight group
-- vim.cmd([[highlight link EchoDocPopup Pmenu]])
