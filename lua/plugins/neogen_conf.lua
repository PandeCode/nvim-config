local ng = Prequire("neogen")

ng.setup({ snippet_engine = "luasnip" })

vim.keymap.set("n", "<LEADER>ng", function()
	vim.ui.select({
		"func",
		"class",
		"type",
		"file",
	}, {
		prompt = "Neogen: ",
	}, function(choice)
		vim.schedule(function()
			ng.generate({ type = choice })
		end)
	end)
end, Keys.Silent)
