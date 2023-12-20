vim.cmd("hi Normal guibg=NONE")

local cursor_vfx = { "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe" }

vim.g.neovide_scale_factor = 0.78 -- 1

vim.g.neovide_floating_blur_amount_x = 10.0 -- 2.0
vim.g.neovide_floating_blur_amount_y = 10.0 -- 2.0

vim.g.neovide_transparency = 0.9 -- 0

-- vim.g.neovide_scroll_animation_length = -- 0.3

vim.g.neovide_hide_mouse_when_typing = true -- false

vim.g.neovide_refresh_rate = 24
vim.g.neovide_refresh_rate_idle = 1
vim.g.neovide_no_idle = false

vim.g.neovide_confirm_quit = false -- true

-- vim.g.neovide_remember_window_size =  -- true

-- vim.g.neovide_profiler = true -- false

-- let g:neovide_input_use_logo = v:false  " v:true on macOS

vim.g.neovide_cursor_vfx_mode = RandFrom(cursor_vfx)
