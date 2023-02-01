vim.g.material_style = "deep ocean"

vim.cmd.colorscheme("material")

vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

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

vim.api.nvim_set_keymap(Keys.N, "<space>bt", ":lua ToggleBackground()<cr>", { noremap = true, silent = true })

require("material").setup({

	-- contrast = {
	-- terminal = false, -- Enable contrast for the built-in terminal
	-- sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
	-- floating_windows = false, -- Enable contrast for floating windows
	-- cursor_line = false, -- Enable darker background for the cursor line
	-- non_current_windows = false, -- Enable darker background for non-current windows
	-- filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	-- },

	-- styles = { -- Give comments style such as bold, italic, underline etc.
	-- comments = { --[[ italic = true ]] },
	-- strings = { --[[ bold = true ]] },
	-- keywords = { --[[ underline = true ]] },
	-- functions = { --[[ bold = true, undercurl = true ]] },
	-- variables = {},
	-- operators = {},
	-- types = {},
	-- },

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		-- "dap",
		-- "dashboard",
		-- "gitsigns",
		-- "hop",
		-- "indent-blankline",
		-- "lspsaga",
		-- "mini",
		-- "neogit",
		"nvim-cmp",
		-- "nvim-navic",
		-- "nvim-tree",
		-- "nvim-web-devicons",
		-- "sneak",
		"telescope",
		-- "trouble",
		"which-key",
	},

	-- disable = {
	--     colored_cursor = false, -- Disable the colored cursor
	--     borders = false, -- Disable borders between verticaly split windows
	--     background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
	--     term_colors = false, -- Prevent the theme from setting terminal colors
	--     eob_lines = false -- Hide the end-of-buffer lines
	-- },

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false, -- Enable higher contrast text for darker style
	},

	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

	-- async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

	-- custom_colors = nil, -- If you want to everride the default colors, set this to a function

	-- custom_highlights = {}, -- Overwrite highlights with your own
})
