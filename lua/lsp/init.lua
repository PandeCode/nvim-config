-- You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.

-- stylua: ignore start
vim.api.nvim_set_keymap(Keys.N, "<space>ls", "<Cmd>LspStart<CR>",   Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<F4>",      "<Cmd>LspStop<CR>",    Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<space>lq", "<Cmd>LspStop<CR>",    Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<space>lr", "<Cmd>LspRestart<CR>", Keys.NoremapSilent)
vim.api.nvim_set_keymap(Keys.N, "<space>li", "<Cmd>LspInfo<CR>",    Keys.NoremapSilent)
-- stylua: ignore end
local border_chars = {
    TOP_LEFT       = "╭", -- ┌
    TOP_RIGHT      = "╮", -- ┐
    MID_HORIZONTAL = "─",
    MID_VERTICAL   = "│",
    BOTTOM_LEFT    = "╰", -- └
    BOTTOM_RIGHT   = "╯" -- ┘
}

vim.g.lsp_utils_location_opts = {
    height                    = 24,
    mode                      = "editor",
    preview                   = {
        title                 = "Location Preview",
        border                = true,
        border_chars          = border_chars
    },
    keymaps                   = {
        n                     = {
            ["<C-n>"]         = "j",
            ["<C-p>"]         = "k"
        }
    }
}

vim.g.lsp_utils_symbols_opts = {
    height                   = 24,
    mode                     = "editor",
    preview                  = {
        title                = "Symbols Preview",
        border               = true,
        border_chars         = border_chars
    },
    prompt                   = {}
}

--vim.lsp.handlers["textDocument/codeAction"]     = require "lsputil.codeAction".code_action_handler
--vim.lsp.handlers["textDocument/references"]     = require "lsputil.locations".references_handler
--vim.lsp.handlers["textDocument/definition"]     = require "lsputil.locations".definition_handler
--vim.lsp.handlers["textDocument/declaration"]    = require "lsputil.locations".declaration_handler
--vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
--vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
--vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
--vim.lsp.handlers["workspace/symbol"]            = require "lsputil.symbols".workspace_handler

ON_ATTACH = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
-- stylua: ignore start
    buf_set_keymap(Keys.N, "<space>ca",        "<Cmd>lua vim.lsp.buf.code_action()<CR>",                                Keys.NoremapSilent)

    buf_set_keymap(Keys.V, "<space>ca",        "<Cmd>lua vim.lsp.buf.code_action()<CR>",                                Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "gD",              "<Cmd>lua vim.lsp.buf.declaration()<CR>",                                Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "gd",              "<Cmd>lua vim.lsp.buf.definition()<CR>",                                 Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "K",               "<Cmd>lua vim.lsp.buf.hover()<CR>",                                      Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "gi",              "<cmd>lua vim.lsp.buf.implementation()<CR>",                             Keys.NoremapSilent)

    buf_set_keymap(Keys.N, "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             Keys.NoremapSilent)
    buf_set_keymap(Keys.V, "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             Keys.NoremapSilent)
    buf_set_keymap(Keys.I, "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               Keys.NoremapSilent)
    buf_set_keymap(Keys.V, "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               Keys.NoremapSilent)
    buf_set_keymap(Keys.I, "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               Keys.NoremapSilent)

    buf_set_keymap(Keys.N, "<space>la",       "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",                       Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<space>ld",       "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",                    Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<space>ll",       "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<space>lD",       "<cmd>lua vim.lsp.buf.type_definition()<CR>",                            Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<F2>",            "<cmd>lua vim.lsp.buf.rename()<CR>",                                     Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "gr",              "<cmd>lua vim.lsp.buf.references()<CR>",                                 Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "g[",              "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",                           Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "g]",              "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                           Keys.NoremapSilent)
    buf_set_keymap(Keys.N, "<space>g<space>", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",                         Keys.NoremapSilent)
-- stylua: ignore end
    --vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
end

vim.lsp.set_log_level "warn"
NVIM_LSP = require "lspconfig"

--CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
CAPABILITIES = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
CAPABILITIES.textDocument.completion.completionItem.snippetSupport = true
CAPABILITIES.textDocument.semanticHighlightingCapabilities= {semanticHighlighting = true}
CAPABILITIES.window.workDoneProgress = true;
CAPABILITIES.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

FLAGS = {
	debounce_text_changes = 500,
}

-- stylua: ignore start

RequireForFileType("cmake",                                                               'lsp.cmake');
RequireForFileType("cpp,c",                                                               'lsp.clangd');
RequireForFileType("csharp",                                                              'lsp.omnisharp');
RequireForFileType("css,jsx,tsx,typescriptreact,javascriptreact",                         'lsp.stylelint_lsp');
RequireForFileType("css,sass,less",                                                       'lsp.cssls');
RequireForFileType("fish,sh,inc,bash,command",                                            'lsp.bashls');
RequireForFileType("gdscript",                                                            'lsp.gdscript');
RequireForFileType("glsl,vert,frag,hlsl",                                                 'lsp.glsl');
RequireForFileType("haskell,lhaskell",                                                    'lsp.haskell');
RequireForFileType("html",                                                                'lsp.html');
RequireForFileType("html,css,jsx,tsx,javascriptreact,typescriptreact,text,txt",           'lsp.emmet');
RequireForFileType("json,jsonc",                                                          'lsp.jsonls');
RequireForFileType("lua",                                                                 'lsp.sumneko_lua');
RequireForFileType("python",                                                              'lsp.pyright');
RequireForFileType("rust",                                                                'lsp.rust');
RequireForFileType("svelte",                                                              'lsp.svelte');
RequireForFileType("ts,js,javascript,typescript,javascriptreact,typescriptreact,jsx,tsx", 'lsp.tsserver');
RequireForFileType("vimscript,vim",                                                       'lsp.vimls');
RequireForFileType("yaml",                                                                'lsp.yamlls');

-- stylua: ignore end

