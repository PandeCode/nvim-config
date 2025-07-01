local base16
local success, result = pcall(dofile, vim.fs.normalize "~/.config/stylix/nvim.lua")

if success and result ~= nil then
	base16 = result
else
	-- Define default palette values
	base16 = {
		base00 = "#1a1b26",
		base01 = "#16161e",
		base02 = "#2f3549",
		base03 = "#444b6a",
		base04 = "#787c99",
		base05 = "#a9b1d6",
		base06 = "#cbccd1",
		base07 = "#d5d6db",
		base08 = "#c0caf5",
		base09 = "#a9b1d6",
		base0A = "#0db9d7",
		base0B = "#9ece6a",
		base0C = "#b4f9f8",
		base0D = "#2ac3de",
		base0E = "#bb9af7",
		base0F = "#f7768e",
	}
end

require("mini.base16").setup {
	use_cterm = true,
	palette = base16,
}

local IsTransparent = false

-- Function to set highlight groups using Lua API
local function set_highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Ensure initial transparent state
set_highlight("Normal", { bg = "NONE" })
set_highlight("NonText", { bg = "NONE" })
set_highlight("SignColumn", { bg = "NONE" })

function ToggleBackground()
	local palette = MiniBase16.config.palette

	if IsTransparent then
		-- Set themed background using Lua API
		set_highlight("Normal", {
			fg = palette.base05,
			bg = palette.base00,
		})

		set_highlight("LineNr", {
			fg = palette.base03,
			bg = palette.base00,
		})

		set_highlight("SignColumn", {
			fg = palette.base03,
			bg = palette.base00,
		})

		IsTransparent = false
	else
		-- Set transparent background using Lua API
		set_highlight("Normal", { bg = "NONE" })
		set_highlight("LineNr", { bg = "NONE" })
		set_highlight("SignColumn", { bg = "NONE" })

		IsTransparent = true
	end
end

-- Map the toggle function using Lua API
vim.keymap.set("n", "<LEADER>bt", ToggleBackground, { noremap = true, silent = true })

local function is_dark(hex)
    -- Remove the # if present
    hex = hex:gsub("#", "")

    -- Convert hex to RGB
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)

    -- Calculate perceived brightness (ITU-R BT.709)
    local brightness = (0.2126 * r + 0.7152 * g + 0.0722 * b)

    -- Return true if dark, false if light
    return brightness < 128
end

-- Set highlight groups with appropriate contrast
for group, color in pairs(base16) do
    local fg_color = is_dark(color) and "#ffffff" or "#000000"
    vim.cmd(string.format("highlight GP_%s guifg=%s guibg=%s gui=NONE", group, fg_color, color))
end
