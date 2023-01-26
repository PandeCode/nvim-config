-- Set up nvim-cmp.
local cmp = require "cmp"

cmp.setup(
	{
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered()
		},

		mapping = {
			["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), {"i", "c"}),

			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
			["<C-e>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
			["<CR>"] = cmp.mapping.confirm({select = true}),
			["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
			["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
		},
		sources = cmp.config.sources(
			{
				{name = "nvim_lsp"},
				{name = "luasnip"},

				{name = "nvim_lua"},
				{name = "treesitter"}
			}, {{name = "path"}, {name = "buffer"}}
		)
	}
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
	"gitcommit", {
		sources = cmp.config.sources(
			{
				{name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
			}, {{name = "path"}, {name = "buffer"}}

		)
	}
)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
	{"/", "?"}, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {{name = "buffer"}, {name = "path"}}
	}
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
	":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
	}
)

-- Set up lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup {capabilities = capabilities}
