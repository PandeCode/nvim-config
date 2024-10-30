    vim.lsp.start({
      name = 'lsp-ai',
      cmd = {'lsp-ai'},
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`ev.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      -- root_dir = vim.fs.root(ev.buf, {'setup.py', 'pyproject.toml'}),
    })

