local packer = require("packer")
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

vim.api.nvim_set_keymap(Keys.N, "<space>ps", "<cmd>PackerSync<cr>", Keys.NoremapSilent)

packer.init({
	ensure_dependencies = true, -- Should packer install plugin dependencies?
	-- package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
	-- compile_path = util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
	plugin_package = "packer", -- The default package for plugins
	max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
	auto_clean = true, -- During sync(), remove unused plugins
	compile_on_sync = true, -- During sync(), run packer.compile()
	disable_commands = false, -- Disable creating commands
	opt_default = false, -- Default to using opt (as opposed to start) plugins
	transitive_opt = true, -- Make dependencies of opt plugins also opt by default
	transitive_disable = true, -- Automatically disable dependencies of disabled plugins
	auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
	git = {
		cmd = "git", -- The base command for git operations
		subcommands = { -- Format strings for git subcommands
			update = "pull --ff-only --progress --rebase=false",
			install = "clone --depth %i --no-single-branch --progress",
			fetch = "fetch --depth 999999 --progress",
			checkout = "checkout %s --",
			update_branch = "merge --ff-only @{u}",
			current_branch = "branch --show-current",
			diff = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
			diff_fmt = "%%h %%s (%%cr)",
			get_rev = "rev-parse --short HEAD",
			get_msg = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
			submodules = "submodule update --init --recursive --progress",
		},
		depth = 1, -- Git clone depth
		clone_timeout = 300, -- Timeout, in seconds, for git clones
		default_url_format = "https://github.com/%s", -- Lua format string used for "aaa/bbb" style plugins
	},
	display = {
		non_interactive = false, -- If true, disable display windows for all operations
		open_fn = nil, -- An optional function to open a window for packer's display
		open_cmd = "65vnew \\[packer\\]", -- An optional command to open a window for packer's display
		working_sym = "⟳", -- The symbol for a plugin being installed/updated
		error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
		done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
		removed_sym = "-", -- The symbol for an unused plugin which was removed
		moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
		header_sym = "━", -- The symbol for the header line in packer's display
		show_all_info = true, -- Should packer show all update details automatically?
		prompt_border = "double", -- Border style of prompt popups.
		keybindings = { -- Keybindings for the display window
			quit = "q",
			toggle_info = "<CR>",
			diff = "d",
			prompt_revert = "r",
		},
	},
	luarocks = {
		python_cmd = "python", -- Set the python command to use for running hererocks
	},
	log = { level = "warn" }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
	profile = {
		enable = false,
		threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
	},
})

return packer.startup({
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient")
				require("impatient").enable_profile()
			end,
		})

		use({
			"github/copilot.vim",
			config = function()
				require("config.copilot")
			end,
		})

		use({
			"michaelb/sniprun",
			run = "bash ./install.sh",
			config = function()
				require("config.sniprunNvim")
			end,
		})

		use({
			"lukas-reineke/headlines.nvim",
			config = function()
				require("config.headlinesNvim")
			end,
		})

		use("ap/vim-css-color")

		use("kyazdani42/nvim-web-devicons")

		use("antoinemadec/FixCursorHold.nvim")

		use({
			"Iron-E/nvim-libmodal",
			config = function()
				require("config.nvimLibmodal")
			end,
		})

		use({
			"luochen1990/rainbow",
			config = function()
				vim.g.rainbow_active = 1 -- set to 0 if you want to enable it later via :RainbowToggle
				vim.cmd([[augroup rainbow]])
				vim.cmd([[	au BufEnter *     hi      TSPunctBracket NONE]])
				vim.cmd([[	au BufEnter *     hi link TSPunctBracket nonexistenthl]])
				vim.cmd([[	au BufEnter *.lua hi      TSConstructor  NONE]])
				vim.cmd([[	au BufEnter *.lua hi link TSConstructor  nonexistenthl]])
				vim.cmd([[augroup END]])
			end,
		})

		use("Yggdroot/indentLine")

		use("folke/which-key.nvim")
		use("sudormrfbin/cheatsheet.nvim")

		use("dbeniamine/cheat.sh-vim")

		use({
			"bfredl/nvim-luadev",
			ft = { "lua" },
			config = function()
				require("config.luadev")
			end,
		})

		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("config.dashboard")
			end,
		})

		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("config.bufferline")
			end,
		})

		use({
			"hoob3rt/lualine.nvim",
			config = function()
				require("config.lualineNvim")
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("config.tree")
			end,
		})
		use({
			"liuchengxu/vista.vim",
			config = function()
				require("config.vista")
			end,
		})

		use({
			"voldikss/vim-floaterm",
			config = function()
				require("config.floatterm")
			end,
		})

		use("haya14busa/incsearch.vim")
		use("haya14busa/incsearch-easymotion.vim")
		use("haya14busa/incsearch-fuzzy.vim")

		use({ "google/vim-maktaba", ft = { "bzl", "bazel" } })
		use({ "google/vim-glaive", ft = { "bzl", "bazel" } })
		use({ "bazelbuild/vim-bazel", ft = { "bzl", "bazel" } })

		use({
			"habamax/vim-godot",
			ft = { "gdscript", "gdscript3" },
			config = function()
				require("config.godot")
			end,
		})
		use({ "neoclide/jsonc.vim", ft = { "json", "jsonc" } })

		use({
			"petrbroz/vim-glsl",
			as = "pgsls",
			ft = { "glsl", "hlsl", "vert", "frag" },
			requires = { { "tikhomirov/vim-glsl", opt = true } },
		})

		use({
			"Konfekt/vim-office",
			ft = { "docx", "pdf", "doc" },
			config = function()
				require("config.office")
			end,
		})

		use({
			"marko-cerovac/material.nvim",
			config = function()
				require("config.theme")
			end,
		})

		use({
			"simnalamburt/vim-mundo",
			config = function()
				require("config.mundo")
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
			ft = {
				"sh",
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"comment",
				"cpp",
				"css",
				"dart",
				"dockerfile",
				"fish",
				"gdscript",
				"go",
				"gomod",
				"graphql",
				"haskell",
				"lhaskell",
				"html",
				"java",
				"javascript",
				"javascriptreact",
				"js",
				"jsx",
				"jsdoc",
				"json5",
				"kotlin",
				"lua",
				"org",
				"python",
				"regex",
				"rst",
				"ruby",
				"rust",
				"scss",
				"surface",
				"svelte",
				"teal",
				"toml",
				"ts",
				"tsx",
				"typescript",
				"typescriptreact",
				"javascript",
				"vimscript",
				"vim",
				"yaml",
			},
		})
		use({ "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" } })

		use({
			"kristijanhusak/orgmode.nvim",
			ft = {
				"org",
			},
			config = function()
				require("config.orgmode")
			end,
			requires = { "akinsho/org-bullets.nvim" },
		})

		-- use "sheerun/vim-polyglot"

		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("lsp")
			end,
			requires = { "RishabhRD/popfix", "RishabhRD/nvim-lsputils" },
			ft = {
				"sh",
				"bash",
				"c",
				"cmake",
				"cpp",
				"csharp",
				"css",
				"gdscript",
				"haskell",
				"lhaskell",
				"html",
				"javascript",
				"javascriptreact",
				"js",
				"json",
				"jsonc",
				"jsx",
				"less",
				"lua",
				"python",
				"rust",
				"sass",
				"svelte",
				"text",
				"ts",
				"tsx",
				"txt",
				"typescript",
				"typescriptreact",
				"vimscript",
				"yaml",
				"glsl",
				"vert",
				"frag",
			},
		})
		use({
			"onsails/lspkind-nvim",
			config = function()
				require("config.lspkind")
			end,
		})
		use({
			"hrsh7th/vim-vsnip",
			config = function()
				require("config.vsnip")
			end,
		})

		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("config.cmpConfig")
			end,
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-vsnip",
			},
		})

		use({ "Shougo/echodoc.vim" })
		use({
			"kkoomen/vim-doge",
			config = function()
				require("config.doge")
			end,
			ft = {
				"cpp",
				"c",
				"java",
				"python",
				"javascript",
				"typescript",
				"typescriptreact",
				"javascriptreact",
				"sh",
				"bash",
				"ruby",
				"php",
				"rust",
				"groovy",
			},
		})

		use({ "nvim-telescope/telescope-media-files.nvim" })
		use({ "nvim-telescope/telescope-github.nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("config.telescope")
			end,
		})

		use({

			"theHamsta/nvim-dap-virtual-text",
			requires = {
				"mfussenegger/nvim-dap",
				"Pocco81/DAPInstall.nvim",
				"rcarriga/nvim-dap-ui",
				"nvim-telescope/telescope-dap.nvim",
				"jbyuki/one-small-step-for-vimkind",
			},
			ft = {
				"lua",
				"cpp",
				"c",
				"rust",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"python",
			},
			config = function()
				require("config.dapConfig")
			end,
		})

		use({ "airblade/vim-gitgutter", "tpope/vim-fugitive" })

		use({
			"andymass/vim-matchup",
			"chaoren/vim-wordmotion",
			"itchyny/vim-cursorword",
			"jeffkreeftmeijer/vim-numbertoggle",
			"mg979/vim-visual-multi",
			"romainl/vim-cool",
			"tpope/vim-repeat",
			"tpope/vim-speeddating",
			"tpope/vim-surround",
		})

		use({
			"junegunn/vim-easy-align",
			config = function()
				require("config.easyalign")
			end,
		})
		use({
			"easymotion/vim-easymotion",
			config = function()
				require("config.easymotion")
			end,
		})
		use({
			"preservim/nerdcommenter",
			config = function()
				require("config.nerdcommenter")
			end,
		})
		use({
			"sbdchd/neoformat",
			config = function()
				require("config.neoformat")
			end,
		})

		use({
			"ludovicchabant/vim-gutentags",
			config = function()
				vim.g.gutentags_cache_dir = vim.fn.expand("~") .. "/.cache/ctags"
			end,
		})
		use("skywind3000/asyncrun.vim")
		use({
			"Shatur/neovim-cmake",
			ft = { "c", "cpp", "cmake" },
			config = function()
				require("config.cmake")
			end,
			requires = { "nvim-telescope/telescope.nvim" },
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("config.autopairs")
			end,
		})

		use({ "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" })

		use({
			"glacambre/firenvim",
			run = function()
				vim.fn["firenvim#install"](0)
			end,
			config = function()
				require("config.firenvim")
			end,
		})

		use("wakatime/vim-wakatime")
		use({
			"andweeb/presence.nvim",
			config = function()
				require("config.discord")
			end,
		})

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("config.todo")
			end,
		})

		use({
			"rcarriga/nvim-notify",
			config = function()
				require("config.notifyNvim")
			end,
		})
		use({
			"dhruvasagar/vim-table-mode",
			config = function()
				require("config.table")
			end,
		})

		use({ "elkowar/yuck.vim", ft = { "yuck" } })

		use_rocks("http")
	end,
})

-- use {
-- 'myusername/example',        -- The plugin location string
---- The following keys are all optional
-- disable = boolean,           -- Mark a plugin as inactive
-- as = string,                 -- Specifies an alias under which to install the plugin
-- installer = function,        -- Specifies custom installer. See "custom installers" below.
-- updater = function,          -- Specifies custom updater. See "custom installers" below.
-- after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
-- rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
-- opt = boolean,               -- Manually marks a plugin as optional.
-- branch = string,             -- Specifies a git branch to use
-- tag = string,                -- Specifies a git tag to use
-- commit = string,             -- Specifies a git commit to use
-- lock = boolean,              -- Skip this plugin in updates/syncs
-- run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
-- requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
-- rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
-- config = string or function, -- Specifies code to run after this plugin is loaded.
---- The setup key implies opt = true
-- setup = string or function,  -- Specifies code to run before this plugin is loaded.
---- The following keys all imply lazy-loading and imply opt = true
-- cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
-- ft = string or list,         -- Specifies filetypes which load this plugin.
-- keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
-- event = string or list,      -- Specifies autocommand events which load this plugin.
-- fn = string or list          -- Specifies functions which load this plugin.
-- cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
-- module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
---- with one of these module names, the plugin will be loaded.
-- module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
-- requiring a string which matches one of these patterns, the plugin will be loaded.
-- }
