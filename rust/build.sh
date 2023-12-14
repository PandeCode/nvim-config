#!/bin/sh

cargo build &&
cp -r lua/debug/librust.so lua/
