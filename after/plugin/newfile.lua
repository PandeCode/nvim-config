-- Template function to insert text into new files
---@param pattern string Pattern to match filenames
---@param text string Template text to insert
---@param pos table {row, col} Cursor position after inserting text
local function createTemplate(pattern, text, pos)
	-- Create an autocommand to handle the event
	vim.api.nvim_create_autocmd("BufNewFile", {
		pattern = pattern, -- Match the given file pattern
		callback = function()
			-- Check if the buffer is empty before inserting text
			if vim.fn.line "$" == 1 and vim.fn.getline(1) == "" then
				-- Insert the template text
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(text, "\n"))

				-- Set the cursor position
				if pos and #pos == 2 then
					vim.api.nvim_win_set_cursor(0, pos)
				end
			end
		end,
	})
end

createTemplate(
	"*.sh",
	[[#!/usr/bin/env bash
]],
	{ 2, 1 }
)

createTemplate(
	"default.nix",
	[[_ :{
	imports = [

	];
}]],
	{ 2, 1 }
)

createTemplate(
	"modules/**.nix",
	[[{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.module;
in {
  options.module.enable = lib.mkEnableOption "enable module";

  config = lib.mkIf cfg.enable {

  };
}]],
	{ 12, 1 }
)

createTemplate(
	"*.nix",
	[[{...}: {

}]],
	{ 2, 2 }
)

createTemplate(
	"main.py",
	[[def main():
    print()

if __name__ == "__main__":
    main()]],
	{ 2, 7 }
)

createTemplate(
	"main.cpp",
	[[#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}]],
	{ 3, 5 }
)
createTemplate(
	"lua/plugins/*.lua",
	[[return {

}]],
	{ 2, 2 }
)

createTemplate(
	"shell.nix",
	[[{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [

  ];
  # nativeBuildInputs = with pkgs; [];

  shellHook = ''
    # export PATH=$PATH:
  '';
}]],
	{ 4, 2 }
)

createTemplate(
	".direnv",
	[[use nix
#use flake]],
	{ 4, 2 }
)
