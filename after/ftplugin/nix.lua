local ts_utils = require "nvim-treesitter.ts_utils"

local function expand_nix_set()
	local parser = vim.treesitter.get_parser(0, "nix")
	local tree = parser:parse()[1]
	local root = tree:root()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local node = ts_utils.get_node_at_cursor()

	while node and node:type() ~= "binding" do
		node = node:parent()
	end

	if not node then
		vim.notify("No valid Nix set found at the cursor", vim.log.levels.ERROR)
		return
	end

	-- Get the text of the node
	local text = vim.treesitter.get_node_text(node, 0)
	local expanded = text:gsub("(%w+)%.(%w+)%s*=%s*{", "%1 = { %2 = {"):gsub(";%s*}", "; }; }")

	vim.print(expanded) -- Debug output

	-- Replace the lines of the node with expanded content
	local start_row, _, end_row, _ = node:range()
	local expanded_lines = vim.split(expanded, "\n", { trimempty = true })
	vim.api.nvim_buf_set_lines(0, start_row, end_row + 1, false, expanded_lines)
end

-- Map the function to a keybinding
vim.keymap.set("n", "<leader>es", expand_nix_set, { noremap = true, silent = true })
