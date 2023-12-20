#!/bin/sh
owd=$CWD

cd ~/.config/nvim/rust
cargo build --release &&
cp -r lua/release/librust.so lua/

cd $owd
