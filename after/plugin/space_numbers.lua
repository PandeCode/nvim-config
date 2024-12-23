-- TODO: Ignore Colors
-- TODO: ignore binary and hex

-- Credit to some guy on reddit who used claude
local separator = ","

-- Place this in your init.lua or a separate plugin file

local ns_id = vim.api.nvim_create_namespace "number_separators"

local function format_number(number_str)
	-- Handle negative numbers
	local sign = ""
	if number_str:sub(1, 1) == "-" then
		sign = "-"
		number_str = number_str:sub(2)
	end

	-- Split into integer and decimal parts
	local int_part, dec_part = number_str:match "([^.]*)(.?.*)"

	-- Format integer part with spaces every 3 digits from the right
	local formatted = int_part:reverse():gsub("(%d%d%d)", "%1" .. separator):reverse():gsub("^%s+", "")

	return sign .. formatted .. dec_part
end

local function apply_number_formatting()
	-- Clear existing virtual text
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for lnum, line in ipairs(lines) do
		-- Find numbers in the line
		for number in line:gmatch "(-?%d+%.?%d*)" do
			local formatted = format_number(number)
			if formatted ~= number then
				-- Find the column where the number starts
				local start_col = line:find(number, 1, true)
				if start_col then
					-- Add virtual text after the number
					vim.api.nvim_buf_set_extmark(0, ns_id, lnum - 1, start_col + #number - 1, {
						virt_text = { { " → " .. formatted, "Comment" } },
						virt_text_pos = "inline",
					})
				end
			end
		end
	end
end

local number_separator_group = vim.api.nvim_create_augroup("NumberSeparator", { clear = true })

local function enable_number_separators()
	vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "InsertLeave" }, {
		group = number_separator_group,
		callback = apply_number_formatting,
	})
	vim.b.number_separators_enabled = true
	apply_number_formatting()
end

local function disable_number_separators()
	vim.api.nvim_clear_autocmds { group = number_separator_group }
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
	vim.b.number_separators_enabled = false
end

-- Initialize the feature
-- enable_number_separators()

-- Add command to toggle the feature
vim.api.nvim_create_user_command("ToggleNumberSeparators", function()
	if vim.b.number_separators_enabled then
		disable_number_separators()
		vim.notify "Number separators disabled"
	else
		enable_number_separators()
		vim.notify "Number separators enabled"
	end
end, {})

local _ = [[
 3141529
 3141523
 3141529.22332

#6272A4
#6272A4
#FFB86C
#FF5555
]]
