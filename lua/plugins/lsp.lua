-- stylua: ignore start
vim.keymap.set("n", "<LEADER>e", function() vim.diagnostic.open_float { float = "rounded" } end, {noremap = true, silent = true })
vim.keymap.set("n", "g[", function() vim.diagnostic.jump { count=-1 , float = "rounded" } end, { noremap = true, silent = true })
vim.keymap.set("n", "g]", function() vim.diagnostic.jump { count=1, float = "rounded" } end, { noremap = true, silent = true })
vim.keymap.set("n", "<LEADER>q", "<CMD>Telescope diagnostics<CR>", { noremap = true, silent = true })
-- stylua: ignore end

-- local flake_file = PathJoin(vim.fn.getenv "HOME", "/dotnix/flake.nix")
local flake_dir = PathJoin(vim.fn.getenv "HOME", "/dotnix/")
local hostname = (RunCmd "hostname"):sub(1, -2)
local whoami = (RunCmd "whoami"):sub(1, -2)

local ft = {
	"cpp",
	"c",
	"go",
	"gdscript",
	"haskell",
	"bash",
	"sh",
	"html",
	"lua",
	"rust",
	"vim",
	"cmake",
	"yaml",
	"json",
	"nix",
	"css",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

local servers = {
	awk_ls = {},
	mpls = {
		cmd = {
			vim.fs.normalize "~/dev/go/mpls/mpls",
			"--dark-mode",

			"--enable-emoji",
			"--enable-footnotes",
		},
		on_attach = function()
			local util = require "lspconfig.util"

			local function print_pdf()
				local current_file_path = vim.api.nvim_buf_get_name(0)
				local full_file_path_with_pdf = current_file_path:gsub("%.%w+$", ".pdf")

				local params = {
					command = "print-pdf",
					arguments = { full_file_path_with_pdf },
				}
				local clients = util.get_lsp_clients {
					bufnr = vim.api.nvim_get_current_buf(),
					name = "mpls",
				}
				for _, client in ipairs(clients) do
					client.request("workspace/executeCommand", params, nil, 0)
				end
			end

			vim.api.nvim_create_user_command("MplsPrintPdf", print_pdf, { nargs = 0 })
		end,
	},
	bashls = {},
	cssls = {},
	cssmodules_ls = {},
	gdscript = {},
	glsl_analyzer = {},
	gopls = {},
	hls = {},
	html = {},
	neocmake = {},
	tailwindcss = { ft = { "html", "javascriptreact", "typescriptreact" } },
	vimls = {},
	vls = {},
	yamlls = {},

	-- nil_ls = {
	-- 	settings = {
	-- 		["nil"] = {
	-- 			formatting = { command = { "alejandra" } },
	-- 		},
	-- 	},
	-- },

	nixd = {
		cmd = { "nixd", "--inlay-hints=true" },
		settings = {
			nixd = {
				nixpkgs = {
					-- expr = "import <nixpkgs> { }",
					expr = 'import (builtins.getFlake "' .. flake_dir .. '").inputs.nixpkgs { }',
				},

				formatting = { command = { "alejandra" } },

				options = {
					nixos = {
						expr = '(builtins.getFlake "'
							.. flake_dir
							.. '").nixosConfigurations.'
							.. hostname
							.. ".options",
					},
					home_manager = {
						expr = '(builtins.getFlake "'
							.. flake_dir
							.. '").homeConfigurations."'
							.. whoami
							.. "@"
							.. hostname
							.. '".options',
					},
				},
			},
		},
	},

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim", "FFI_RUST", "Snacks" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
				completion = {
					callSnippet = "Replace",
					keywordSnippet = "Both",
					workspaceWord = true,
				},
			},
		},
	},
	rust_analyzer = {
		cmd = { "rust-analyzer" },
		-- cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
		completion = {
			capable = {
				snippets = "add_parenthesis",
			},
		},
		settings = {
			["rust-analyzer"] = {
				cargo = {
					targetDir = PathJoin(vim.fn.getenv "HOME", ".cache/target"),
				},
				-- lspMux = {
				-- 	version = "1",
				-- 	method = "connect",
				-- 	server = "rust-analyzer",
				-- },
				diagnostics = {
					enable = true,
				},
			},
		},
	},

	pylyzer = {
		settings = {
			python = {
				checkOnType = true,
				diagnostics = true,
				inlayHints = true,
				smartCompletion = true,
			},
		},
	},

	-- pylsp = {
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 				pycodestyle = {
	-- 					-- ignore = { "W391" },
	-- 					maxLineLength = 100,
	-- 				},
	-- 				rope_autoimport = {
	-- 					memory = true,
	-- 					enabled = true,
	-- 				},
	-- 				rope_completion = {
	-- 					enabled = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- basedpyright = {
	-- 	settings = {
	-- 		python = {
	-- 			analysis = {
	-- 				autoSearchPaths = true, -- Used to automatically add search paths based on some predefined nam es (like src).
	-- 				diagnosticMode = "openFilesOnly",
	-- 				useLibraryCodeForTypes = true,
	-- 				stubPath = vim.fn.expand "~/.cache/typings",
	-- 				typeCheckingMode = "basic", -- Used to specify the level of type checking analysis performed.
	-- 			},
	-- 		},
	-- 	},
	-- },
	clangd = {
		capabilities = { offsetEncoding = { "utf-16" } },
		on_attach = function()
			vim.keymap.set("n", "<leader>si", ":ClangdShowSymbolInfo<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gh", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
		end,
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
			return
		end
		require("lsp_signature").on_attach({}, bufnr)

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

		vim.keymap.set("n", "<leader>ca", function()
			require("tiny-code-action").code_action()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<F2>", ":Lspsaga rename<CR>", bufopts)

		vim.keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", bufopts)
		vim.keymap.set("n", "gD", ":Lspsaga peek_type_definition<CR>", bufopts)
		vim.keymap.set("n", "<LEADER>gd", ":Lspsaga goto_definition<CR>", bufopts)
		vim.keymap.set("n", "<LEADER>gD", ":Lspsaga goto_type_definition<CR>", bufopts)

		vim.keymap.set("n", "<LEADER>lf", ":Lspsaga finder tyd+ref+imp+def<CR>", bufopts)
	end,
})

local M = {
	{
		"nvimdev/lspsaga.nvim",
		ft = ft,
		opts = {
			lightbulb = {
				enable = false,
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		config = function()
			vim.diagnostic.config { virtual_text = false }
			require("tiny-inline-diagnostic").setup()
		end,
	},
	{
		"rachartier/tiny-code-action.nvim",
		ft = ft,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		opts = {
			backend = "delta",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "ray-x/lsp_signature.nvim" },
		ft = ft,
		init_options = {
			userLanguages = {
				rust = "html",
			},
		},
		config = function()
			local lspconfig = require "lspconfig"
			local configs = require "lspconfig.configs"

			if not configs.mpls then
				configs.mpls = {
					default_config = {
						cmd = { "mpls" },
						filetypes = { "markdown" },
						single_file_support = true,
						root_dir = require("lspconfig").util.find_git_ancestor,
						settings = {},
					},
					docs = {
						description = [[https://github.com/mhersson/mpls

Markdown Preview Language Server (MPLS) is a language server that provides
live preview of markdown files in your browser while you edit them in your favorite editor.
                ]],
					},
				}
			end

			for server, config in pairs(servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},

	{
		"https://github.com/nvimtools/none-ls.nvim",
		ft = {
			"nu",
			-- "markdown", "nix"
		},
		config = function()
			local null_ls = require "null-ls"

			null_ls.setup {
				sources = {
					null_ls.builtins.code_actions.proselint,
					null_ls.builtins.code_actions.statix,
					null_ls.builtins.completion.spell,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.misspell,
					null_ls.builtins.diagnostics.statix,
				},
			}

			-- local no_really = {
			-- 	method = null_ls.methods.DIAGNOSTICS,
			-- 	filetypes = { "markdown", "text" },
			-- 	generator = {
			-- 		fn = function(params)
			-- 			local diagnostics = {}
			-- 			for i, line in ipairs(params.content) do
			-- 				local col, end_col = line:find "really"
			-- 				if col and end_col then
			-- 					table.insert(diagnostics, {
			-- 						row = i,
			-- 						col = col,
			-- 						end_col = end_col + 1,
			-- 						source = "no-really",
			-- 						message = "Don't use 'really!'",
			-- 						severity = vim.diagnostic.severity.WARN,
			-- 					})
			-- 				end
			-- 			end
			-- 			return diagnostics
			-- 		end,
			-- 	},
			-- }
			--
			-- null_ls.register(no_really)
		end,
		lazy = true,
	},

	{
		"jmbuhr/otter.nvim",
		keys = {
			{ "<leader>on", ":lua require('otter').activate()<CR>" },
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}

if vim.env.NO_LSP then
	vim.print "No Lsp"
	return {}
else
	return M
end
