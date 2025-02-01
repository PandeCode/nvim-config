vim.keymap.set("n", "<leader>ex", function()
	local binding_node = TS.GetNodeAtCursorByName "binding"
	local attrpath_node = TS.GetNodeAtCursorByName "attrpath"
	local attr_node = TS.GetNodeAtCursorByName "identifier"

	if binding_node == nil or attrpath_node == nil or attr_node == nil then
		return
	end

	local attr = vim.treesitter.get_node_text(attr_node, 0)
	local expression = vim.treesitter.get_node_text(binding_node:child(2), 0)
	local attrpath = vim.tbl_filter(
		function(text)
			return text ~= nil and text ~= "."
		end,
		vim.tbl_map(function(child)
			return vim.treesitter.get_node_text(child, 0)
		end, TS.GetNodeChildren(attrpath_node))
	)

	local final_str = ""
	local found = false
	for i, child in ipairs(attrpath) do
		if attr ~= child then
			if not found then
				final_str = final_str .. child .. "."
			else
				final_str = final_str .. child
				if i ~= #attrpath then
					final_str = final_str .. "."
				end
			end
		elseif attr == child then
			if i == #attrpath then
				return vim.notify("Final node, Cannot Expand", vim.log.levels.WARN)
			end
			final_str = final_str .. child .. " = { \n"
			found = true
		end
	end
	final_str = final_str .. " = " .. expression .. ";\n };"

	local start_row, start_col, end_row, end_col = binding_node:range()
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.fn.split(final_str, "\n"))

	vim.notify "Set expanded!"
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ev", function()
    -- Get the current buffer's file path
    local current_file = vim.fn.expand('%:p')

    -- Create the buffer name for the nix evaluation
    local buf_name = 'nix-eval-' .. vim.fn.fnamemodify(current_file, ':t')

    -- Check if the buffer already exists
    local existing_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.fn.bufname(buf) == buf_name then
            existing_buf = buf
            break
        end
    end

    -- Create or get the buffer
    local buf
    if existing_buf then
        buf = existing_buf
    else
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(buf, buf_name)
    end

    -- Set up the command
    local cmd = string.format('nix-instantiate --show-trace --eval %s', vim.fn.shellescape(current_file))

    -- Create a window to the right if it doesn't exist
    local win = nil
    if not existing_buf then
        local current_win = vim.api.nvim_get_current_win()
        vim.cmd([[
        set splitright
        vsplit ]])
        win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(win, buf)
        vim.api.nvim_set_current_win(current_win)  -- Return focus to original window
    end

    -- Clear the buffer before new content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

    -- Track if we've received any output
    local has_output = false
    local error_lines = {}

    -- Run the command and handle the output
    vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
            if data and data[1] ~= "" then
                has_output = true
                vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
            end
        end,
        on_stderr = function(_, data)
            if data and data[1] ~= "" then
                has_output = true
                -- Add error prefix and store error lines
                local prefixed_data = {}
                for _, line in ipairs(data) do
                    if line ~= "" then
                        table.insert(prefixed_data, "Error: " .. line)
                        table.insert(error_lines, line)
                    end
                end
                vim.api.nvim_buf_set_lines(buf, -1, -1, false, prefixed_data)
            end
        end,
        on_exit = function(_, exit_code)
            if exit_code ~= 0 then
                -- If we haven't received any output yet, show the exit code
                if not has_output then
                    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
                        string.format("Error: Command failed with exit code %d", exit_code)
                    })
                end
                -- Show error in status line
                if #error_lines > 0 then
                    vim.api.nvim_echo({{error_lines[1], "ErrorMsg"}}, true, {})
                end
            end
        end
    })

    -- Set the buffer filetype
    vim.api.nvim_buf_set_option(buf, 'filetype', 'nix')
end)
