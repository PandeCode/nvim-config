local notify = require("notify")

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("reload_waybar_config", { clear = true }),
	pattern = "*/.config/waybar/**",
	callback = function(tbl)
		vim.keymap.set("n", "<SPACE>sf", function()
			vim.cmd("!killall -9 waybar ; waybar & disown")
			notify("Reloaded Waybar", "info", {
				title = "Waybar",
			})
		end
, { buffer = tbl.buf })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("waybar_config_json5", { clear = true }),
	pattern = "*/.config/waybar/config",
	command = [[set ft=json5]],
})
