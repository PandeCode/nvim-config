-- Enable alignment
vim.g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 0

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_sh_shfmt = {
	exe = "shfmt",
	stdin = 1,
	args = {
		"-sr", -- Redirect operators will be followed by a space.
		"-ci", -- Switch cases will be indented.
		"-s", -- Simplify the code.
		"-i", -- Indent: 0 for tabs (default), >0 for number of spaces.
		"0",
	},
}

vim.g.neoformat_stylua = {
	exe = "stylua",
	stdin = 1,
	args = {
		"--config-path=~/.stylua.toml",
		"--stdin-filepath",
		'"%=p"',
		"--",
		"-",
	},
}

vim.g.neoformat_enabled_sh = { "shfmt" }

vim.g.neoformat_enabled_lua = { "stylua" }

vim.g.neoformat_enabled_js = { "prettier" }

vim.g.neoformat_enabled_json = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_ts = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_jsx = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_tsx = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_typescript = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_javascript = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_typescriptreact = vim.g.neoformat_enabled_js
vim.g.neoformat_enabled_javascriptreact = vim.g.neoformat_enabled_js

vim.g.neoformat_enabled_python = { "black" }
vim.g.neoformat_cmake_cmakeformat = { args = {}, stdin = 1, exe = "cmake-format" }
vim.g.neoformat_only_msg_on_error = 0

vim.api.nvim_set_keymap(Keys.N, "<Space>cf", ":Neoformat<CR>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.V, "<Space>cf", ":Neoformat<CR>", Keys.Noremap)

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
