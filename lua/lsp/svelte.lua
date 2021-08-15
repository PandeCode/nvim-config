NVIM_LSP.svelte.setup {
    on_attach = ON_ATTACH,
    capabilities = CAPABILITIES,
    --

    cmd = {"svelteserver", "--stdio"},
    filetypes = {"svelte"}

    --root_dir = root_pattern("package.json", ".git")
}
