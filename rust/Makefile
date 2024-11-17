build: src/**.rs
	cargo build --release

install: ~/.cache/target/release/librust.so ./lua/librust.so
	cp ~/.cache/target/release/librust.so lua
