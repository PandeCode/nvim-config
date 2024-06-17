local refactoring = require("refactoring")
local lang_block = {
	go = true,
	cpp = true,
	c = true,
	java = true,
}


refactoring.setup({
	show_success_message = true,
	prompt_func_return_type = lang_block,
	prompt_func_param_type = lang_block,
})

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

require("telescope").load_extension("refactoring")

vim.keymap.set(
	{ "n", "x" },
	"<leader>rr",
	function() require('telescope').extensions.refactoring.refactors() end
)

vim.keymap.set({ "x", "n" }, "<leader>rv", function() require('refactoring').debug.print_var() end)
-- Supports both visual and normal mode

vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end)
-- Supports only normal mode
