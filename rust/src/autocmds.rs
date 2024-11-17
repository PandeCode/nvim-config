use miette::Result;
use nvim_oxi::api;
use nvim_oxi::{self as oxi};
use oxi::api::opts::{CreateAutocmdOpts};
use oxi::Error;

pub fn autocmds() -> Result<(), Error> {
	let mk_dyn_case = |b| {
		CreateAutocmdOpts::builder()
			.desc("Dynamic Smartcase")
			.patterns([":"])
			// .group("dynamic_smartcase")
			.callback(move |_| {
				api::set_option("smartcase", b)?;
				Ok::<bool, Error>(false)
			})
			.build()
	};

	api::create_autocmd(["CmdLineEnter"], &mk_dyn_case(false))?;
	api::create_autocmd(["CmdLineLeave"], &mk_dyn_case(true))?;
	Ok(())
}
