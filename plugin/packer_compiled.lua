-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/shawn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/shawn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/shawn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/shawn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shawn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["dart-vim-plugin"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  dracula = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/dracula"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["gundo.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/gundo.vim"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/incsearch-easymotion.vim"
  },
  ["incsearch-fuzzy.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/incsearch-fuzzy.vim"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["jsonc.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-node-modules.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope-vimspector.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-vimspector.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-bazel"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-bazel"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-cmake"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-cmake"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-doge"] = {
    commands = {},
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-glaive"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-glaive"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-glsl"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-godot"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-lsp-cxx-highlight"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-lsp-cxx-highlight"
  },
  ["vim-maktaba"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-maktaba"
  },
  ["vim-matchup"] = {
    after_files = { "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-numbertoggle"
  },
  ["vim-office"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-office"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-textobj-comment"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  vimspector = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cargo ++once lua require("packer.load")({'rust.vim'}, { ft = "cargo" }, _G.packer_plugins)]]
vim.cmd [[au FileType gdscript ++once lua require("packer.load")({'vim-godot'}, { ft = "gdscript" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-cmake', 'vim-doge', 'vimspector', 'vim-lsp-cxx-highlight'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'vim-cmake'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'jsonc.vim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsonc ++once lua require("packer.load")({'jsonc.vim'}, { ft = "jsonc" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'vim-doge'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-doge', 'vimspector'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-doge', 'vimspector'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-doge', 'vimspector'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'vim-doge', 'vimspector'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdowm ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdowm" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'vim-doge', 'vimspector'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'vim-doge'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-doge'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'vim-doge'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType groovy ++once lua require("packer.load")({'vim-doge'}, { ft = "groovy" }, _G.packer_plugins)]]
vim.cmd [[au FileType golang ++once lua require("packer.load")({'vim-go'}, { ft = "golang" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'dart-vim-plugin'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType flutter ++once lua require("packer.load")({'dart-vim-plugin'}, { ft = "flutter" }, _G.packer_plugins)]]
vim.cmd [[au FileType bzl ++once lua require("packer.load")({'vim-maktaba', 'vim-bazel', 'vim-glaive'}, { ft = "bzl" }, _G.packer_plugins)]]
vim.cmd [[au FileType bazel ++once lua require("packer.load")({'vim-maktaba', 'vim-bazel', 'vim-glaive'}, { ft = "bazel" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-cmake', 'vim-doge', 'vimspector', 'vim-lsp-cxx-highlight'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim', 'vim-doge', 'vimspector'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin/ftdetect/dart.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin/ftdetect/dart.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin/ftdetect/dart.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gdscript.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gdscript.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gdscript.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gsl.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gsl.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot/ftdetect/gsl.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
