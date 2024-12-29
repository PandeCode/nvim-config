mod autocmds;
mod commands;
mod keymaps;
mod options;

use miette::Result;
use nvim_oxi::{self as oxi, Dictionary, Error, Function, Object};
use std::fs;
use std::io;
use std::path::Path;

#[oxi::plugin]
fn libffi_rust() -> Result<Dictionary, Error> {
    let lua_list_dir = Function::from_fn(|dir: String| {
        match fs::read_dir(&dir) {
            Ok(entries) => {
                let paths: Vec<String> = entries
                    .filter_map(|entry| entry.ok()) // Filter out errors
                    .map(|entry| entry.path().display().to_string()) // Convert to String
                    .collect();
                Some(paths)
            }
            Err(_) => None,
        }
    });

    let lua_is_image = Function::from_fn(|file: String| {
        match file.get(file.len() - 4..file.len()).unwrap_or("") {
            "jpeg" | "webp" | ".png" | ".jpg" | ".gif" => true,
            _ => false,
        }
    });

    Ok(Dictionary::from_iter([
        ("list_dir", Object::from(lua_list_dir)),
        ("is_image", Object::from(lua_is_image)),
        (
            "keymaps",
            Object::from(Function::from_fn(|()| {
                let _ = keymaps::keymaps();
            })),
        ),
        (
            "options",
            Object::from(Function::from_fn(|()| {
                let _ = options::options();
            })),
        ),
        (
            "autocmds",
            Object::from(Function::from_fn(|()| {
                let _ = autocmds::autocmds();
            })),
        ),
        (
            "commands",
            Object::from(Function::from_fn(|()| {
                let _ = commands::commands();
            })),
        ),
    ]))
}
