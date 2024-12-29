-- stylua: ignore start
vim.keymap.set("n", "<LEADER>e", function() vim.diagnostic.open_float { float = "rounded" } end, { noremap = true, silent = true })
vim.keymap.set("n", "g[", function() vim.diagnostic.goto_prev { float = "rounded" } end, { noremap = true, silent = true })
vim.keymap.set("n", "g]", function() vim.diagnostic.goto_next { float = "rounded" } end, { noremap = true, silent = true })
vim.keymap.set("n", "<LEADER>q", "<CMD>Telescope diagnostics<CR>", { noremap = true, silent = true })
-- stylua: ignore end

local servers = {
	ast_grep = {},
	awk_ls = {},
	bashls = {},
	cssls = {},
	cssmodules_ls = {},
	gdscript = {},
	glsl_analyzer = {},
	gopls = {},
	hls = {},
	html = {},
	neocmake = {},
	tailwindcss = {},
	vimls = {},
	vls = {},
	yamlls = {},

	nil_ls = {
		settings = {
			["nil"] = {
				formatting = { command = { "alejandra" } },
			},
		},
	},

	-- nixd = {
	-- 	{
	-- 		cmd = { "nixd" },
	-- 		settings = {
	-- 			nixd = {
	-- 				nixpkgs = {
	-- 					expr = "import <nixpkgs> { }",
	-- 				},
	-- 				formatting = {
	-- 					command = { "nixfmt" },
	-- 				},
	-- 				options = {
	-- 					nixos = {
	-- 						expr = '(builtins.getFlake "~/dotnix/flake.nix").nixosConfigurations.wslnix.options',
	-- 					},
	-- 					home_manager = {
	-- 						expr = '(builtins.getFlake "~/dotnix/flake.nix").homeConfigurations.shawn.options',
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },

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
		-- cmd = { "rust-analyzer" },
		cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
		completion = {
			capable = {
				snippets = "add_parenthesis",
			},
		},
		settings = {
			["rust-analyzer"] = {
				lspMux = {
					version = "1",
					method = "connect",
					server = "rust-analyzer",
				},
				diagnostics = {
					enable = false,
				},
			},
		},
	},
	pyright = {
		-- basedpyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true, -- Used to automatically add search paths based on some predefined nam es (like src).
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					stubPath = vim.fn.expand "~/.cache/typings",
					typeCheckingMode = "basic", -- Used to specify the level of type checking analysis performed.
				},
			},
		},
	},
	clangd = {
		capabilities = { offsetEncoding = { "utf-16" } },
		on_attach = function()
			vim.keymap.set("n", "<leader>si", ":ClangdShowSymbolInfo<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gh", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
		end,
	},
}

return {
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup {
				lightbulb = {
					enable = false,
				},
			}
			-- require("lspsaga.symbol.winbar").get_bar()
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
		end,
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
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup {
				backend = "delta",
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "ray-x/lsp_signature.nvim" },
		config = function()
			local lspconfig = require "lspconfig"
			for server, config in pairs(servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},

	{
		"https://github.com/nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require "null-ls"
			local helpers = require "null-ls.helpers"

			null_ls.setup {
				sources = {
					-- null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				},
			}

			local markdownlint = {
				method = null_ls.methods.DIAGNOSTICS,
				filetypes = { "markdown" },
				-- null_ls.generator creates an async source
				-- that spawns the command with the given arguments and options
				generator = null_ls.generator {
					command = "markdownlint",
					args = { "--stdin" },
					to_stdin = true,
					from_stderr = true,
					-- choose an output format (raw, json, or line)
					format = "line",
					check_exit_code = function(code, stderr)
						local success = code <= 1

						if not success then
							-- can be noisy for things that run often (e.g. diagnostics), but can
							-- be useful for things that run on demand (e.g. formatting)
							print(stderr)
						end

						return success
					end,
					-- use helpers to parse the output from string matchers,
					-- or parse it manually with a function
					on_output = helpers.diagnostics.from_patterns {
						{
							pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
							groups = { "row", "col", "message" },
						},
						{
							pattern = [[:(%d+) [%w-/]+ (.*)]],
							groups = { "row", "message" },
						},
					},
				},
			}

			local no_really = {
				method = null_ls.methods.DIAGNOSTICS,
				filetypes = { "markdown", "text" },
				generator = {
					fn = function(params)
						local diagnostics = {}
						-- sources have access to a params object
						-- containing info about the current file and editor state
						for i, line in ipairs(params.content) do
							local col, end_col = line:find "really"
							if col and end_col then
								-- null-ls fills in undefined positions
								-- and converts source diagnostics into the required format
								table.insert(diagnostics, {
									row = i,
									col = col,
									end_col = end_col + 1,
									source = "no-really",
									message = "Don't use 'really!'",
									severity = vim.diagnostic.severity.WARN,
								})
							end
						end
						return diagnostics
					end,
				},
			}

			null_ls.register(no_really)
			null_ls.register(markdownlint)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
		end,
		lazy = true,
	},
}
