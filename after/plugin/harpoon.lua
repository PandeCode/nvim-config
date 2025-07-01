for i = 1, 9 do
	local mark_char = string.char(64 + i) -- A=65, B=66, etc.
	vim.keymap.set("n", "<leader>m" .. i, function()
		local mark_pos = vim.api.nvim_get_mark(mark_char, {})
		if mark_pos[1] == 0 then
			vim.cmd "normal! gg"
			vim.cmd("mark " .. mark_char)
			vim.cmd "normal! ``" -- Jump back to where we were
		else
			vim.cmd("normal! `" .. mark_char) -- Jump to the bookmark
			vim.cmd 'normal! `"' -- Jump to the last cursor position before leaving
		end
	end, { desc = "Toggle mark " .. mark_char })
end

-- Delete mark from current buffer
vim.keymap.set("n", "<leader>md", function()
	for i = 1, 9 do
		local mark_char = string.char(64 + i)
		local mark_pos = vim.api.nvim_get_mark(mark_char, {})

		-- Check if mark is in current buffer
		if mark_pos[1] ~= 0 and vim.api.nvim_get_current_buf() == mark_pos[3] then
			vim.cmd("delmarks " .. mark_char)
		end
	end
end, { desc = "Delete mark" })

vim.keymap.set("n", "<leader>ml", function()
	Snacks.picker {
		picker = {
			marks = {
				transform = function(item)
					if item.label and item.label:match "^[A-I]$" and item then
						item.label = "" .. string.byte(item.label) - string.byte "A" + 1 .. ""
						return item
					end
					return false
				end,
			},
		},
	}
end, { desc = "List bookmarks" })
