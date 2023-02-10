---@diagnostic disable-next-line: lowercase-global
function print_var()
	local bufnr = vim.api.nvim_get_current_buf()
	local current_word = vim.fn.expand("<cword>")
	local ft = vim.bo.ft
	local current_line_number = vim.fn.line(".")

	vim.api.nvim_buf_set_lines(bufnr, current_line_number, current_line_number, false, {
		(function()
			if ft == "cpp" then
				return 'std::cout << "' .. current_word .. '" << ' .. current_word .. " << std::endl;"
			elseif ft == "rust" then
				return 'println!("' .. current_word .. ': {}", ' .. current_word .. ");"
			elseif ft == "python" then
				return 'print("' .. current_word .. ": { " .. current_word .. '}")'
			elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
				return 'console.log("' .. current_word .. ': ", ' .. current_word .. ");"
			elseif ft == "sh" or ft == "bash" then
				return 'echo -n ' .. current_word
			end

	return 'print("' .. current_word .. ': ", ' .. current_word .. ")"
		end)(),
	})
	vim.cmd("normal :" .. current_line_number + 1 .."<cr>=:"..current_line_number .. "<cr>")
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.rs", "*.lua" },
	callback = function(tbl)
		vim.keymap.set("n", "<leader>lv", print_var, { buffer = tbl.buf })
	end,
})
