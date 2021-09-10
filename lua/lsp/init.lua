-- You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<space>ls", "<Cmd>LspStart<CR>",   opts)
vim.api.nvim_set_keymap("n", "<space>lq", "<Cmd>LspStop<CR>",    opts)
vim.api.nvim_set_keymap("n", "<space>lr", "<Cmd>LspRestart<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>li", "<Cmd>LspInfo<CR>",    opts)

local border_chars = {
    TOP_LEFT       = "┌",
    TOP_RIGHT      = "┐",
    MID_HORIZONTAL = "─",
    MID_VERTICAL   = "│",
    BOTTOM_LEFT    = "└",
    BOTTOM_RIGHT   = "┘"
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

vim.lsp.handlers["textDocument/codeAction"]     = require "lsputil.codeAction".code_action_handler
vim.lsp.handlers["textDocument/references"]     = require "lsputil.locations".references_handler
vim.lsp.handlers["textDocument/definition"]     = require "lsputil.locations".definition_handler
vim.lsp.handlers["textDocument/declaration"]    = require "lsputil.locations".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
vim.lsp.handlers["workspace/symbol"]            = require "lsputil.symbols".workspace_handler

ON_ATTACH = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.

    buf_set_keymap("n", "<space>a",        "<Cmd>lua vim.lsp.buf.code_action()<CR>",                                opts)

    buf_set_keymap("v", "<space>a",        "<Cmd>lua vim.lsp.buf.code_action()<CR>",                                opts)
    buf_set_keymap("n", "gD",              "<Cmd>lua vim.lsp.buf.declaration()<CR>",                                opts)
    buf_set_keymap("n", "gd",              "<Cmd>lua vim.lsp.buf.definition()<CR>",                                 opts)
    buf_set_keymap("n", "K",               "<Cmd>lua vim.lsp.buf.hover()<CR>",                                      opts)
    buf_set_keymap("n", "gi",              "<cmd>lua vim.lsp.buf.implementation()<CR>",                             opts)

    buf_set_keymap("n", "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             opts)
    buf_set_keymap("v", "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             opts)
    buf_set_keymap("i", "<m-k>",           "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             opts)
    buf_set_keymap("n", "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               opts)
    buf_set_keymap("v", "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               opts)
    buf_set_keymap("i", "<g-k>",           "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               opts)

    buf_set_keymap("n", "<space>la",       "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",                       opts)
    buf_set_keymap("n", "<space>ld",       "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",                    opts)
    buf_set_keymap("n", "<space>ll",       "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>lD",       "<cmd>lua vim.lsp.buf.type_definition()<CR>",                            opts)
    buf_set_keymap("n", "<F2>",            "<cmd>lua vim.lsp.buf.rename()<CR>",                                     opts)
    buf_set_keymap("n", "gr",              "<cmd>lua vim.lsp.buf.references()<CR>",                                 opts)
    buf_set_keymap("n", "g[",              "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",                           opts)
    buf_set_keymap("n", "g]",              "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                           opts)
    buf_set_keymap("n", "<space>g<space>", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",                         opts)

    --vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
end

vim.lsp.set_log_level "trace"
NVIM_LSP = require "lspconfig"

CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
CAPABILITIES.textDocument.completion.completionItem.snippetSupport = true
--CAPABILITIES.textDocument.semanticHighlightingCapabilities.semanticHighlighting = true
CAPABILITIES.window.workDoneProgress = true;

require("lsp.bashls")
require("lsp.clangd")
require("lsp.cmake")
require("lsp.cssls")
require("lsp.gdscript")
require("lsp.html")
require("lsp.jsonls")
require("lsp.omnisharp")
require("lsp.pyright")
require("lsp.stylelint_lsp")
require("lsp.sumneko_lua")
require("lsp.svelte")
require("lsp.tsserver")
require("lsp.vimls")
require("lsp.yamlls")
