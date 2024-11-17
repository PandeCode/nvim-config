-- vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

vim.api.nvim_set_keymap(Keys.N, "<space>bt", ":lua ToggleBackground()<cr>", { noremap = true, silent = true })

require("tokyonight").setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	-- on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	-- on_highlights = function(highlights, colors) end,
})

vim.cmd.colorscheme("tokyonight")

IsTransparent = false
function ToggleBackground()
	if IsTransparent then
		vim.cmd(
			[[hi Normal guifg=#8F93A2 guibg=#0F111A | hi LineNr ctermfg=11 guifg=#3B3F51 | hi SignColumn ctermfg=14 ctermbg=242 guifg=#8F93A2 guibg=#0F111A]]
		)
		IsTransparent = false
	else
		vim.cmd(
			[[hi Normal ctermbg=NONE guibg=NONE | hi LineNr ctermbg=NONE guibg=NONE | hi SignColumn ctermbg=NONE guibg=NONE]]
		)
		IsTransparent = true
	end
end
