local api = vim.api
local ts = vim.treesitter
local notify = require("notify")

local parsers = require("nvim-treesitter.parsers")
local ts_utils = require("nvim-treesitter.ts_utils")
local utils = require("nvim-treesitter.utils")
local ns_id = api.nvim_create_namespace("go_fn_ret")

local function hasReturnExprList(node)
	-- TODO:
	return false
end

api.nvim_create_autocmd("TextChangedI,TextChanged", {
	pattern = { "*.go" },
	group = api.nvim_create_augroup("go_parse", { clear = true }),
	callback = function(tbl)
		local bufnr = tbl.bufnr or 0
		local root = TS.get_root("go", bufnr)

		local func_query = ts.parse_query(
			"go",
			[[
(function_declaration
	result: (parameter_list) @res
) @func
]]
		)
		for id, node in func_query:iter_captures(root, bufnr, 0, -1) do
			if func_query.captures[id] == "func" then
				local parameter_list_1_found = false
				local parameter_list_2_found = false
				local virt_text
				for func_child in node:iter_children() do
					if func_child:type() == "parameter_list" then
						if parameter_list_1_found then
							virt_text = (TS.get_node_text(func_child, bufnr)) or "ERROR"
							parameter_list_2_found = true
						else
							parameter_list_1_found = true
						end
					end
				end

				for func_child in node:iter_children() do
					if parameter_list_2_found then
						if func_child:type() == "block" then
							for body_child in func_child:iter_children() do
								if body_child:type() == "return_statement" then
									if body_child:child_count() == 1 then
										local range = { body_child:range() }
										if range ~= nil then
											-- pcall(nvim_buf_del_extmark, 0, ns_id, 1)
											api.nvim_buf_set_extmark(0, ns_id, range[1], range[2], {
												id = 1,
												virt_text = { { virt_text, "Question" } },
												virt_text_pos = "eol",
											})
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})
