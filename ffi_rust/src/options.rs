use miette::Result;
use nvim_oxi::{api::set_option_value, Error};

pub fn options() -> Result<(), Error> {
    let opts_none = &nvim_oxi::api::opts::OptionOpts::builder().build();
    macro_rules! set_opt {
        ($name:expr) => {
            let _ = set_option_value($name, true, opts_none);
        };
        ($name:expr, $value:expr) => {
            let _ = set_option_value($name, $value, opts_none);
        };
        ($name:expr, $value:expr, $opts:expr) => {
            set_option_value($name, $value, $opts);
        };
    }

    set_opt!("conceallevel", 1);

    // set_opt!("t_Co", 256);
    // set_opt!("t_ut", true);
    // set_opt!("shortmess", (vim.o.shortmess .. "c"));
    set_opt!("expandtab", false);
    set_opt!("ci");
    set_opt!("pi");
    // set_opt!("sts", 0);
    set_opt!("shiftwidth", 4);
    set_opt!("tabstop", 4);

    set_opt!("autoindent");
    set_opt!("backspace", "indent,eol,start");
    set_opt!("backup", false);
    set_opt!("clipboard", "unnamed");
    set_opt!("cmdheight", 1);
    set_opt!("completeopt", "menu,menuone,noselect");
    set_opt!("confirm");
    set_opt!("encoding", "UTF-8");
    set_opt!("gdefault");
    set_opt!("guifont", "FantasqueSansM Nerd Font,:h20");
    // set_opt!("t.guifont", { "ComicShannsMono Nerd Font", ":h20" });
    // set_opt!("t.guifont", { "Cascadia Code", ":h20" });
    set_opt!("hidden");
    set_opt!("hlsearch");
    set_opt!("ignorecase");
    set_opt!("inccommand", "nosplit");
    set_opt!("incsearch");
    set_opt!("linebreak");
    set_opt!("list");
    set_opt!("number");
    set_opt!("pumblend", 20);
    set_opt!("ruler");
    set_opt!("scrolloff", 3);
    set_opt!("showcmd");
    set_opt!("showmatch");
    set_opt!("showtabline", 2);
    set_opt!("signcolumn", "yes");
    set_opt!("smartcase");
    set_opt!("splitbelow");
    set_opt!("synmaxcol", 128);
    set_opt!("termguicolors");
    set_opt!("timeout");
    set_opt!("timeoutlen", 1000);
    // set_opt!("ttimeoutlen", 0);
    set_opt!("ttyfast");
    set_opt!(
        "undodir",
        std::env::home_dir()
            .unwrap()
            .join(".cache/nvim/undodir")
            .to_str()
            .unwrap()
    );
    set_opt!("undofile");
    set_opt!("updatetime", 250);
    set_opt!("visualbell");
    set_opt!("winblend", 20);
    set_opt!("wrap");
    set_opt!("writebackup", false);

    // " Nice menu when typing `:find *.py`
    // set_opt!("wildmode", "longest,list,full");
    // set_opt!("wildmenu");
    // " Ignore files

    set_opt!(
        "wildignore",
        "*.pyc,*_build/*,**/coverage/*,**/Debug/*,**/build/*,**/node_modules/*,**/android/*,**/\
		 ios/*,**/.git/*"
    );

    Ok(())
}
