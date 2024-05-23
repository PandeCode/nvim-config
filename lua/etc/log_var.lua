---@diagnostic disable-next-line: lowercase-global
local function log_var()
	local bufnr = vim.api.nvim_get_current_buf()
	local current_word = vim.fn.expand("<cword>")
	local ft = vim.bo.ft
	local current_line_number = vim.fn.line(".")
	local spacing = "	"

	-- local line = vim.api.nvim_buf_get_lines(bufnr, current_line_number, current_line_number, false)[1]

	vim.api.nvim_buf_set_lines(bufnr, current_line_number, current_line_number, false, {
		spacing .. (function()
			if ft == "cpp" then
				return 'std::cerr << "' .. current_word .. '" << ' .. current_word .. " << std::endl;"
			elseif ft == "c" then
				return 'fprintf(stderr, "' .. current_word .. ': %s ", ' .. current_word .. ');';
			elseif ft == "rust" then
				return 'println!("' .. current_word .. ': {:#?}", ' .. current_word .. ");"
			elseif ft == "python" then
				return 'print("' .. current_word .. ": { " .. current_word .. '}")'
			elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
				return 'console.log("' .. current_word .. ': ", ' .. current_word .. ");"
			elseif ft == "sh" or ft == "bash" then
				return "echo -n " .. current_word
			end

			return 'print("' .. current_word .. ': ", ' .. current_word .. ")"
		end)(),
	})
	vim.cmd("normal :" .. current_line_number + 1 .. "<cr>=:" .. current_line_number .. "<cr>")
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.c", "*.cpp", "*.rs", "*.lua", "*.py", "*.js", "*.jsx", "*.ts", "*.tsx" },
	group = vim.api.nvim_create_augroup("LogVar", { clear = true }),
	callback = function(tbl)
		vim.api.nvim_buf_create_user_command(tbl.buf, "LogVar", function(cmd_tbl)
			PrintTable(cmd_tbl)
		end, { range = true })
		vim.keymap.set("n", "<leader>lv", log_var, { buffer = tbl.buf })
	end,
})
