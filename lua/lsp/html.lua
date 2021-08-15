NVIM_LSP.html.setup {
    on_attach = ON_ATTACH,
    capabilities = CAPABILITIES,
    --
    cmd = {"vscode-html-language-server", "--stdio"},
    filetypes = {"html"},
    init_options = {
        configurationSection = {"html", "css", "javascript"},
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    },
    settings = {}
    --root_dir = function(fname) return root_pattern(fname) or vim.loop.os_homedir() end,
}
