local refactoring = require("refactoring")
refactoring.setup({})

local ref = function(t)
	return function()
		refactoring.refactor(t)
	end
end

-- Remaps for the refactoring operations currently offered by the plugin
vim.keymap.set(Keys.V, "<LEADER>re", ref("Extract Function"), Keys.NoremapSilentExpr)
vim.keymap.set(Keys.V, "<LEADER>rf", ref("Extract Function To File"), Keys.NoremapSilentExpr)
vim.keymap.set(Keys.V, "<LEADER>rv", ref("Extract Variable"), Keys.NoremapSilentExpr)
vim.keymap.set(Keys.V, "<LEADER>ri", ref("Inline Variable"), Keys.NoremapSilentExpr)

-- Extract block doesn't need visual mode
vim.keymap.set(Keys.N, "<LEADER>rb", ref("Extract Block"), Keys.NoremapSilentExpr)
vim.keymap.set(Keys.N, "<LEADER>rbf", ref("Extract Block To File"), Keys.NoremapSilentExpr)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.keymap.set(Keys.N, "<LEADER>ri", ref("Inline Variable"), Keys.NoremapSilentExpr)

vim.keymap.set(Keys.N, "<LEADER>rr", refactoring.select_refactor, Keys.NoremapSilentExpr)
vim.keymap.set(Keys.V, "<LEADER>rr", refactoring.select_refactor, Keys.NoremapSilentExpr)
