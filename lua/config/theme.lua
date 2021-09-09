vim.g.material_style = "deep ocean"

vim.cmd [[colorscheme material]]

require("material").setup(
	{

		contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
		borders = false, -- Enable borders between verticaly split windows

		italics = {
			comments = true, -- Enable italic comments
			keywords = true, -- Enable italic keywords
			functions = true, -- Enable italic functions
			strings = true, -- Enable italic strings
			variables = true -- Enable italic variables
		},

		contrast_windows = { -- Specify which windows get the contrasted (darker) background
			"terminal", -- Darker terminal background
			"packer", -- Darker packer background
			"qf" -- Darker qf list background
		},

		text_contrast = {
			lighter = false, -- Enable higher contrast text for lighter style
			darker = false -- Enable higher contrast text for darker style
		},

		disable = {
			background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
			term_colors = false, -- Prevent the theme from setting terminal colors
			eob_lines = false -- Hide the end-of-buffer lines
		},

		custom_highlights = {} -- Overwrite highlights with your own
	}
)

IsTransparent = false

function ToggleBackground()
	if IsTransparent then
		vim.cmd [[hi Normal guifg=#8F93A2 guibg=#0F111A | hi LineNr ctermfg=11 guifg=#3B3F51 | hi SignColumn ctermfg=14 ctermbg=242 guifg=#8F93A2 guibg=#0F111A]]
		IsTransparent = false
	else
		vim.cmd [[hi Normal ctermbg=NONE guibg=NONE | hi LineNr ctermbg=NONE guibg=NONE | hi SignColumn ctermbg=NONE guibg=NONE]]
		IsTransparent = true
	end
end

vim.api.nvim_set_keymap(
	"n", "<space>bt", ":lua ToggleBackground()<cr>",
	{noremap = true, silent = true}
)
