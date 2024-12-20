#!/bin/sh

mkdir -p ~/.cache/target/release

cd ffi_rust
nix-shell --run "cargo build --release"
cd ..

cp ~/.cache/target/release/libffi_rust.so lua
