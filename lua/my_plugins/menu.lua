vim.cmd [[
  aunmenu PopUp

  anoremenu PopUp.Inspect           <CMD>Inspect<CR>
  nnoremenu PopUp.Back             <C-t>
  anoremenu PopUp.URL              gx
  anoremenu PopUp.Format           <CMD>Format<CR>
  vnoremenu PopUp.Comment          gc
  nnoremenu PopUp.Comment          gcc

  amenu PopUp.-1-                  <NOP>

  anoremenu PopUp.CodeAction       <CMD>Lspsaga code_action<CR>
  anoremenu PopUp.Rename           <CMD>Lspsaga rename<CR>

  anoremenu PopUp.References       <CMD>lua vim.lsp.buf.references()<CR>
  anoremenu PopUp.Implementation   <CMD>lua vim.lsp.buf.implementation()<CR>
  
  anoremenu PopUp.PeekDefinition   <CMD>Lspsaga peek_definition<CR>
  anoremenu PopUp.PeekTypeDefinItion <CMD>Lspsaga peek_type_definition<CR>

  anoremenu PopUp.GotoDefinition   <CMD>Lspsaga goto_definition<CR>
  anoremenu PopUp.GotoTypeDefinItion <CMD>Lspsaga goto_type_definition<CR>
  anoremenu PopUp.Finder           <CMD>Lspsaga finder tyd+ref+imp+def<CR>

  amenu PopUp.-2-                  <NOP>

  anoremenu PopUp.Refactors       <CMD>lua require('telescope').extensions.refactoring.refactors()<CR>
  anoremenu PopUp.Extract         <CMD>Refactor extract<CR>
  anoremenu PopUp.ExtractToFile   <CMD>Refactor extract_to_file<CR>
  anoremenu PopUp.ExtractVar      <CMD>Refactor extract_var<CR>
  anoremenu PopUp.InlineVar       <CMD>Refactor inline_var<CR>
  anoremenu PopUp.InlineFunc      <CMD>Refactor inline_func<CR>
  anoremenu PopUp.ExtractBlock    <CMD>Refactor extract_block<CR>
  anoremenu PopUp.ExtractBlockToFile <CMD>Refactor extract_block_to_file<CR>
  anoremenu PopUp.PrintVar        <CMD>lua require('refactoring').debug.print_var()<CR>
  anoremenu PopUp.Printf          <CMD>lua require('refactoring').debug.printf { below = false }<CR>
  anoremenu PopUp.Cleanup         <CMD>lua require('refactoring').debug.cleanup()<CR>
]]

local group = vim.api.nvim_create_augroup("nvim_menu", { clear = true })

vim.api.nvim_create_autocmd({ "MenuPopup" }, {
	pattern = "*",
	group = group,
	desc = "Custom PopUp Setup",
	callback = function()
		vim.cmd [[
      amenu disable PopUp.URL
      amenu disable PopUp.CodeAction
      amenu disable PopUp.Rename
      amenu disable PopUp.References
      amenu disable PopUp.Implementation
      amenu disable PopUp.PeekDefinition
      amenu disable PopUp.PeekTypeDefinItion
      amenu disable PopUp.GotoDefinition
      amenu disable PopUp.GotoTypeDefinItion
      amenu disable PopUp.Finder

      amenu disable PopUp.Refactors
      amenu disable PopUp.Extract
      amenu disable PopUp.ExtractToFile
      amenu disable PopUp.ExtractVar
      amenu disable PopUp.InlineVar
      amenu disable PopUp.InlineFunc
      amenu disable PopUp.ExtractBlock
      amenu disable PopUp.ExtractBlockToFile
      amenu disable PopUp.PrintVar
      amenu disable PopUp.Printf
      amenu disable PopUp.Cleanup

      amenu disable PopUp.-1-
      amenu disable PopUp.-2-
    ]]

		if vim.lsp.get_clients({ bufnr = 0 })[1] then
			vim.cmd [[
        amenu enable PopUp.-1-

        amenu enable PopUp.CodeAction
        amenu enable PopUp.Rename
        amenu enable PopUp.References
        amenu enable PopUp.Implementation
        amenu enable PopUp.PeekDefinition
        amenu enable PopUp.PeekTypeDefinItion
        amenu enable PopUp.GotoDefinition
        amenu enable PopUp.GotoTypeDefinItion
        amenu enable PopUp.Finder
      ]]
		end

		local filetype = vim.bo.filetype
		local supported_filetypes = {
			typescript = true,
			javascript = true,
			lua = true,
			c = true,
			cpp = true,
			go = true,
			python = true,
			java = true,
			cs = true,
		}

		if supported_filetypes[filetype] then
			vim.cmd [[
        amenu enable PopUp.-2-

        amenu enable PopUp.Refactors
        amenu enable PopUp.Extract
        amenu enable PopUp.ExtractToFile
        amenu enable PopUp.ExtractVar
        amenu enable PopUp.InlineVar
        amenu enable PopUp.InlineFunc
        amenu enable PopUp.ExtractBlock
        amenu enable PopUp.ExtractBlockToFile
        amenu enable PopUp.PrintVar
        amenu enable PopUp.Printf
        amenu enable PopUp.Cleanup
      ]]
		end

		-- Uncomment and modify this block if URL detection is needed.
		-- local urls = require("vim.ui")._get_urls()
		-- if urls[1] and vim.startswith(urls[1], "http") then
		--   vim.cmd [[ amenu enable PopUp.URL ]]
		-- end
	end,
})
