mod keymaps;
mod autocmds;

use nvim_oxi::{self as oxi, Dictionary, Function, Object};
use std::convert::Infallible;

use miette::Result;
use oxi::Error;


#[oxi::module]
fn librust() -> Result<Dictionary, Error> {
    let add = Function::from_fn(|(a, b): (i32, i32)| Ok::<_, Infallible>(a + b));
    let multiply = Function::from_fn(|(a, b): (i32, i32)| Ok::<_, Infallible>(a * b));
    let compute = Function::from_fn(|(fun, a, b): (Function<(i32, i32), i32>, i32, i32)| fun.call((a, b)));

    keymaps::keymaps()?;
    autocmds::autocmds()?;

    Ok(Dictionary::from_iter([
        ("add", Object::from(add)),
        ("multiply", Object::from(multiply)),
        ("compute", Object::from(compute)),
    ]))
}

