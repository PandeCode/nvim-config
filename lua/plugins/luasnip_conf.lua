require("luasnip.loaders.from_vscode").load(
	{
		paths = {
			vim.fn.expand("~/.config/nvim/snippets/"),
			vim.fn.expand("~/.config/friendly-snippets/")
		}
	}
)

