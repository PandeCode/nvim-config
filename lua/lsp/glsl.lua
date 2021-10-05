--local configs = require("lspconfig/configs")

--if not NVIM_LSP.glsl_ls then
	--configs.glsl_ls = {
		--default_config = {
			--cmd = { "glslls", "-v", "--stdin" },
			--filetypes = { "glsl", "hlsl", "vert", "frag" },
			-----@diagnostic disable-next-line: unused-local
			--root_dir = function(fname)
				--return vim.loop.cwd()
			--end,
			--settings = {},
		--},
	--}
--end

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.

--NVIM_LSP.glsl_ls.setup({ on_attach = ON_ATTACH, capabilities = capabilities, flags = FLAGS })




