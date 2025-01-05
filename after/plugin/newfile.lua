-- Template function to insert text into new files
---@param pattern string Pattern to match filenames
---@param text string Template text to insert
---@param pos table {row, col} Cursor position after inserting text
local function CreateTemplate(pattern, text, pos)
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

-- Examples of template usage
CreateTemplate(
	"*.nix",
	[[{...}: {

}]],
	{ 2, 2 }
)

CreateTemplate(
	"main.py",
	[[def main():
    print()

if __name__ == "__main__":
    main()]],
	{ 2, 7 }
)

CreateTemplate(
	"main.cpp",
	[[#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}]],
	{ 3, 5 }
)
