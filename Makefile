ffi_rust: ffi_rust/src/**.rs
	(cd ffi_rust && nix-shell --run "cargo build --release")
	mkdir -p lua
	cp ~/.cache/target/release/libffi_rust.so lua

clean_nvim:
	rm -fr ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
