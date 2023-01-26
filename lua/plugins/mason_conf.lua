-- https://github.com/williamboman/mason.nvim
require("mason").setup(
	{
		ui = {
			border = "single",

			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		},

		pip = {upgrade_pip = true}

	}
)
