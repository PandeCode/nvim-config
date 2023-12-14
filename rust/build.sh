#!/bin/sh

cargo build --release&&
cp -r lua/release/librust.so lua/
