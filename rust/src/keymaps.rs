use nvim_oxi::api::{self, types::Mode};
use nvim_oxi::{self as oxi};
use oxi::api::opts::SetKeymapOpts;

use miette::Result;
use oxi::Error;

pub fn keymaps() -> Result<(), Error> {
    api::set_var("mapleader", " ")?;

    let n = &Mode::Normal;
    let v = &Mode::Visual;
    let a = &Mode::NormalVisualOperator;
    let i = &Mode::Insert;
    let c = &Mode::CmdLine;

    let none = &SetKeymapOpts::default();

    let noremap = &(SetKeymapOpts::builder().noremap(true).build());
    let noremap_expr = &(SetKeymapOpts::builder().noremap(true).expr(true).build());
    let noremap_silent = &(SetKeymapOpts::builder().noremap(true).silent(true).build());

    #[rustfmt::skip]
    let keymaps = [

        (v, "<LEADER>so",   ":sort<cr>",             none),
        (n, "<LEADER>ne",   ":set noexpandtab!<cr>", noremap),
        (n, "<LEADER>et",   ":set expandtab!<cr>",   noremap),
        (n, "<LEADER>qa",   ":noautocmd qall!<cr>",  none),
        (n, "<LEADER>sf",   ":w<cr>",                none),
        (n, "<LEADER>fe",   ":edit<cr>",             none),
        (n, "<LEADER>nw",   "<CMD>%s/\\s*$//<CR>",   none),
        (n, "<LEADER>`",    "<CMD>edit #<CR>",       none),
        (n, "<LEADER>p",    "\"_dP",                 none),
        (n, "<LEADER>gf",   ":e <cfile><cr>",        none),
        (n, "<LEADER><F2>", "*:%s//",                none),
        (a, "<A-a>",        "<c-a>",                 noremap), // increament
        (a, "<A-x>",        "<c-x>",                 noremap), // decreament
        (n, "L",            "$",                     none),
        (n, "H",            "^",                     none),
        (n, "Q",            "",                      none),    // Disable visual mode
        
        (
            n,
            "<Home>",
            "(col('.') == matchend(getline('.'), '^\\s*')+1 ? '0' : '^')",
            noremap_expr,
        ),
        (
            n,
            "<End>",
            "(col('.') == match(getline('.'), '\\s*$') ? '$' : 'g_')",
            noremap_expr,
        ),
        (
            v,
            "<End>",
            "(col('.') == match(getline('.'), '\\s*$') ? '$h' : 'g_')",
            noremap_expr,
        ),

        (i, "<Home>",     "<C-o><Home>",     none),
        (i, "<End> ",     "<C-o><End>",      none),
        (n, "gg",         "gg0",             noremap),
        (a, "G",          "G<End>",          noremap),
        (a, "Y",          "y$",              noremap),
        (n, "<LEADER>w",  "<c-w>",           noremap),
        (n, "<LEADER>w|", "<CMD>vsplit<CR>", noremap),
        (n, "<LEADER>w_", "<CMD>split<CR>",  noremap),
        // system clipboard
        (n, "<c-c>",      "\"+y\"",          noremap),
        (v, "<c-c>",      "\"+y\"",          noremap),
        (n, "<c-v>",      "\"+p\"",          noremap),
        (i, "<c-v>",      "<c-r>+",          noremap),
        (c, "<c-v>",      "<c-r>+",          noremap),
        (n, "<c-x>",      "<c-c>d",          none),
        (i, "<c-x>",      "<c-c>d",          none),
        (c, "<c-x>",      "<c-c>d",          none),

        // use <c-r> to insert original character without triggering things like auto-pairs
        (i, "<c-r>", "<c-v>", noremap),
        (n, "<LEADER>fs", ":w<CR>", noremap),
        (n, "<F1>", "<esc>", noremap),
        (i, "<F1>", "<esc>", noremap),
        (n, "n", "nzzzv", noremap),
        (n, "N", "Nzzzv", noremap),
        (n, "J", "mzJ`z", noremap),
        (i, ",", ",<c-g>u", noremap),
        (i, ".", ".<c-g>u", noremap),
        (i, "!", "!<c-g>u", noremap),
        (i, "?", "?<c-g>u", noremap),
        (i, "[", "[<c-g>u", noremap),
        (i, "]", "]<c-g>u", noremap),
        (i, "(", "(<c-g>u", noremap),
        (i, ")", ")<c-g>u", noremap),
        (i, "{", "{<c-g>u", noremap),
        (i, "}", "}<c-g>u", noremap),
        (i, "\"", "\"<c-g>u", noremap),

        (
            n,
            "k",
            "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",
            noremap_expr,
        ),
        (
            n,
            "j",
            "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",
            noremap_expr,
        ),

        (v, "<c-j>", ":m '>+1<CR>gv=gv", noremap),
        (v, "<c-k>", ":m '<-2<CR>gv=gv", noremap),
        (n, "<c-j>", ":m .+1<CR>==", noremap),
        (i, "<c-k>", "<esc>:m .-2<CR>==i", noremap),
        (n, "<c-k>", ":m .-1<CR>==", noremap),
        (i, "<c-j>", "<esc>:m .+1<CR>==i", noremap),
        // Add space bellow or above without leaving normal mode
        (
            n,
            "[<LEADER>",
            ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>",
            noremap_silent,
        ),
        (
            n,
            "]<LEADER>",
            ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>",
            noremap_silent,
        ),
        (n, "<", "v<gv<esc>", noremap),
        (n, ">", "v>gv<esc>", noremap),
        (v, "<", "<gv", noremap),
        (v, ">", ">gv", noremap),
        (v, "`", "<esc>`>a`<esc>`<i`<esc>", noremap),
        (v, "(", "<esc>`>a)<esc>`<i(<esc>", noremap),
        (v, "'", "<esc>`>a'<esc>`<i'<esc>", noremap),
        (v, "<c-{>", "<esc>`>a}<esc>`<i{<esc>", noremap),
        (v, ")", "<esc>`>a)<esc>`<i(<esc>", noremap),
        (v, "]", "<esc>`>a]<esc>`<i[<esc>", noremap),
        (v, "<c-}>", "<esc>`>a}<esc>`<i{<esc>", noremap),
    ];

    for keymap in keymaps {
        api::set_keymap(*keymap.0, keymap.1, keymap.2, keymap.3)?;
    }

    Ok(())
}
