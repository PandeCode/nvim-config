local configs = require("lspconfig/configs")

if not NVIM_LSP.glsl then
	configs.glsl_ls = {
		default_config = {
			cmd = { "glslls", "--stdin" },
			filetypes = { "glsl", "hlsl", "vert", "frag" },
			---@diagnostic disable-next-line: unused-local
			root_dir = function(fname)
				return vim.loop.cwd()
			end,

    		single_file_support = true,
			settings = {},
		},
	}
end

NVIM_LSP.glsl.setup({ on_attach = ON_ATTACH, capabilities = CAPABILITIES, flags = FLAGS })
