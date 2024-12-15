local wrap_format_stop_blocks = {
	{ "lua", "-- stylua: ignore start", "-- stylua: ignore end" },
	{ "python", "# fmt: off", "# fmt: on" },
	{ { "haskell", "lhaskell" }, "{- ORMOLU_DISABLE -}", "{- ORMOLU_ENABLE -}" },
	{ { "cpp", "c" }, "// clang-format off", "// clang-format on" },
}

local top_format_stop_blocks = {
	{
		{
			"js",
			"ts",
			"tsx",
			"jsx",
			"vue",
			"json",
			"svelte",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		"// prettier-ignore",
	},
	{ "rust", "#[rustfmt::skip]" },
}

function add_wrap_format_stop_block(filetypes, start, stop)
	filetypes = type(filetypes) == "table" and filetypes or { filetypes }

	vim.api.nvim_create_autocmd("Filetype", {
		pattern = filetypes,
		callback = function(tbl)
			vim.keymap.set(
				"v",
				"<SPACE>fo",
				"vnoremap <buffer> <SPACE>fo <esc>`>a" .. stop .. "<esc>`<i" .. start .. "<esc>",
				{ buffer = tbl.buf }
			)
		end,
	})

	vim.api.nvim_create_autocmd("Filetype", {
		pattern = filetypes,
		callback = function(tbl)
			vim.keymap.set("n", "<SPACE>fo", "<esc>{o" .. start .. "<esc>}O" .. stop .. "<esc>", { buffer = tbl.buf })
		end,
	})
end

function add_top_format_stop_block(filetypes, top)
	filetypes = type(filetypes) == "table" and filetypes or { filetypes }

	vim.api.nvim_create_autocmd("Filetype", {
		pattern = filetypes,
		callback = function(tbl)
			vim.keymap.set("v", "<SPACE>fo", "<esc>`<i" .. top .. "<esc>", { buffer = tbl.buf })
		end,
	})

	vim.api.nvim_create_autocmd("Filetype", {
		pattern = filetypes,
		callback = function(tbl)
			vim.keymap.set("n", "<SPACE>fo", "<esc>{o" .. top .. "<esc>", { buffer = tbl.buf })
		end,
	})
end

for _, wrap_format_stop_block in ipairs(wrap_format_stop_blocks) do
	add_wrap_format_stop_block(wrap_format_stop_block[1], wrap_format_stop_block[2], wrap_format_stop_block[3])
end

for _, top_format_stop_block in ipairs(top_format_stop_blocks) do
	add_top_format_stop_block(top_format_stop_block[1], top_format_stop_block[2])
end

