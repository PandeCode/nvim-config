#!/bin/sh

mkdir -p ~/.cache/target/release

nix-shell --run "cargo build --release"

cp ~/.cache/target/release/libffi_rust.so ../lua
