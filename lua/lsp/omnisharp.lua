local pid = vim.fn.getpid()
local omnisharp_bin = os.getenv("HOME") .. "/Applications/omnisharp-linux-x86/run"

NVIM_LSP.omnisharp.setup {
    on_attach = ON_ATTACH,
    --
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    filetypes = {"cs", "vb"},
    init_options = {}
    --root_dir = root_pattern(".sln") or root_pattern(".csproj")
}
