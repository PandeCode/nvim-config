mod autocmds;
mod keymaps;
mod options;

use miette::Result;
use nvim_oxi::{self as oxi, Dictionary, Function, Object};
use oxi::Error;

#[oxi::plugin]
fn librust() -> Result<Dictionary, Error> {
	keymaps::keymaps()?;
	options::options()?;
	autocmds::autocmds()?;

	// I leave these functions in to check if the api is working
	let add = Function::from_fn(|(a, b): (i32, i32)| a + b);
	let multiply = Function::from_fn(|(a, b): (i32, i32)| a * b);
	let compute = Function::from_fn(|(fun, a, b): (Function<(i32, i32), i32>, i32, i32)| {
		fun.call((a, b)).unwrap()
	});

	Ok(Dictionary::from_iter([
		("add", Object::from(add)),
		("multiply", Object::from(multiply)),
		("compute", Object::from(compute)),
	]))
}
