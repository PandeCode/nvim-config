NVIM_LSP.pyright.setup {
    on_attach = ON_ATTACH,
    capabilities = CAPABILITIES,
    --
    cmd = {"pyright-langserver", "--stdio"},
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}
