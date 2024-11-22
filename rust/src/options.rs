use miette::Result;
use nvim_oxi::{self as oxi, api::set_option_value};
use oxi::Error;

pub fn options() -> Result<(), Error> {
	let opts_none = &nvim_oxi::api::opts::OptionOpts::builder().build();
	macro_rules! set_opt {
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
	set_opt!("ci", true);
	set_opt!("pi", true);
	// set_opt!("sts", 0);
	set_opt!("shiftwidth", 4);
	set_opt!("tabstop", 4);

	set_opt!("autoindent", true);
	set_opt!("backspace", "indent,eol,start");
	set_opt!("backup", false);
	set_opt!("clipboard", "unnamed");
	set_opt!("cmdheight", 1);
	set_opt!("completeopt", "menu,menuone,noselect");
	set_opt!("confirm", true);
	set_opt!("encoding", "UTF-8");
	set_opt!("gdefault", true);
	set_opt!("guifont", "FantasqueSansM Nerd Font,:h20");
	// set_opt!("t.guifont", { "ComicShannsMono Nerd Font", ":h20" });
	// set_opt!("t.guifont", { "Cascadia Code", ":h20" });
	set_opt!("hidden", true);
	set_opt!("hlsearch", true);
	set_opt!("ignorecase", true);
	set_opt!("inccommand", "nosplit");
	set_opt!("incsearch", true);
	set_opt!("lazyredraw", true);
	set_opt!("linebreak", true);
	set_opt!("list", true);
	set_opt!("number", true);
	set_opt!("pumblend", 20);
	set_opt!("ruler", true);
	set_opt!("scrolloff", 3);
	set_opt!("showcmd", true);
	set_opt!("showmatch", true);
	set_opt!("showtabline", 2);
	set_opt!("signcolumn", "yes");
	set_opt!("smartcase", true);
	set_opt!("splitbelow", true);
	set_opt!("synmaxcol", 128);
	set_opt!("termguicolors", true);
	set_opt!("timeout", true);
	set_opt!("timeoutlen", 1000);
	// set_opt!("ttimeoutlen", 0);
	set_opt!("ttyfast", true);
	set_opt!(
		"undodir",
		std::env::home_dir()
			.unwrap()
			.join(".cache/nvim/undodir")
			.to_str()
			.unwrap()
	);
	set_opt!("undofile", true);
	set_opt!("updatetime", 250);
	set_opt!("visualbell", true);
	set_opt!("winblend", 20);
	set_opt!("wrap", true);
	set_opt!("writebackup", false);

	// " Nice menu when typing `:find *.py`
	// set_opt!("wildmode", "longest,list,full");
	// set_opt!("wildmenu", true);
	// " Ignore files

	set_opt!(
		"wildignore",
		"*.pyc,*_build/*,**/coverage/*,**/Debug/*,**/build/*,**/node_modules/*,**/android/*,**/\
		 ios/*,**/.git/*"
	);

	Ok(())
}
