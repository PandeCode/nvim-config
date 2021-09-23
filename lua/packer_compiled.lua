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
local package_path_str = "/home/shawn/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/shawn/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/shawn/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/shawn/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shawn/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config.bufferline\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["compe-tmux"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/compe-tmux"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.dashboard\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  firenvim = {
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20config.firenvim\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\1\2L\0\0\2\0\3\0\t4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/impatient.nvim"
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
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config.lspkind\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23config.lualineNvim\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.theme\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  neoformat = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.neoformat\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neovim-cmake"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.cmake\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/neovim-cmake"
  },
  nerdcommenter = {
    config = { "\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25config.nerdcommenter\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.autopairs\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.compe\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\1\2)\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\14dapConfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-libmodal"] = {
    config = { "\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24config.nvimLibmodal\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-libmodal"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2#\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-luadev"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18config.luadev\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16config.tree\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  pgsls = {
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/pgsls"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config.discord\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
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
    config = { "\27LJ\1\2Q\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\17node_modules\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/telescope-node-modules.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.telescope\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-bazel"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-bazel"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-doge"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16config.doge\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.easyalign\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config.easymotion\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.floatterm\frequire\0" },
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
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-glsl"
  },
  ["vim-godot"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.godot\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-godot"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-maktaba"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-maktaba"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.mundo\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-numbertoggle"
  },
  ["vim-office"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18config.office\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/opt/vim-office"
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
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.vsnip\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["vista.vim"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.vista\frequire\0" },
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/shawn/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2#\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.floatterm\frequire\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.vista\frequire\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\1\2L\0\0\2\0\3\0\t4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: vim-mundo
time([[Config for vim-mundo]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.mundo\frequire\0", "config", "vim-mundo")
time([[Config for vim-mundo]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23config.lualineNvim\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.theme\frequire\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16config.tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
try_loadstring("\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20config.firenvim\frequire\0", "config", "firenvim")
time([[Config for firenvim]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\25config.nerdcommenter\frequire\0", "config", "nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config.easymotion\frequire\0", "config", "vim-easymotion")
time([[Config for vim-easymotion]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config.lspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: neoformat
time([[Config for neoformat]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.neoformat\frequire\0", "config", "neoformat")
time([[Config for neoformat]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17config.vsnip\frequire\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22config.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-libmodal
time([[Config for nvim-libmodal]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\24config.nvimLibmodal\frequire\0", "config", "nvim-libmodal")
time([[Config for nvim-libmodal]], false)
-- Config for: vim-easy-align
time([[Config for vim-easy-align]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21config.easyalign\frequire\0", "config", "vim-easy-align")
time([[Config for vim-easy-align]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19config.discord\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType c_sharp ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "c_sharp" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'vim-doge', 'neovim-cmake'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType teal ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "teal" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-treesitter', 'vim-doge'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'vim-doge'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType comment ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "comment" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'nvim-luadev'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'nvim-treesitter', 'vim-doge'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType gdscript3 ++once lua require("packer.load")({'vim-godot'}, { ft = "gdscript3" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'telescope-node-modules.nvim', 'vim-doge'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'jsonc.vim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsdoc ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "jsdoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'vim-doge'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimscript ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "vimscript" }, _G.packer_plugins)]]
vim.cmd [[au FileType bazel ++once lua require("packer.load")({'vim-maktaba', 'vim-bazel', 'vim-glaive'}, { ft = "bazel" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType pdf ++once lua require("packer.load")({'vim-office'}, { ft = "pdf" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'telescope-node-modules.nvim', 'vim-doge'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType groovy ++once lua require("packer.load")({'vim-doge'}, { ft = "groovy" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'nvim-treesitter', 'neovim-cmake'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType doc ++once lua require("packer.load")({'vim-office'}, { ft = "doc" }, _G.packer_plugins)]]
vim.cmd [[au FileType vert ++once lua require("packer.load")({'pgsls'}, { ft = "vert" }, _G.packer_plugins)]]
vim.cmd [[au FileType surface ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "surface" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-treesitter', 'nvim-treesitter', 'nvim-dap', 'telescope-node-modules.nvim', 'vim-doge'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType glsl ++once lua require("packer.load")({'pgsls'}, { ft = "glsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsonc ++once lua require("packer.load")({'jsonc.vim'}, { ft = "jsonc" }, _G.packer_plugins)]]
vim.cmd [[au FileType docx ++once lua require("packer.load")({'vim-office'}, { ft = "docx" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'telescope-node-modules.nvim', 'vim-doge'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'vim-doge', 'neovim-cmake'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType kotlin ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "kotlin" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'nvim-treesitter', 'vim-doge'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType frag ++once lua require("packer.load")({'pgsls'}, { ft = "frag" }, _G.packer_plugins)]]
vim.cmd [[au FileType dockerfile ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-treesitter', 'nvim-dap', 'vim-doge'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType gdscript ++once lua require("packer.load")({'nvim-treesitter', 'vim-godot'}, { ft = "gdscript" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType rst ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "rst" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType json5 ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "json5" }, _G.packer_plugins)]]
vim.cmd [[au FileType hlsl ++once lua require("packer.load")({'pgsls'}, { ft = "hlsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType bzl ++once lua require("packer.load")({'vim-maktaba', 'vim-bazel', 'vim-glaive'}, { ft = "bzl" }, _G.packer_plugins)]]
vim.cmd [[au FileType regex ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "regex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/elixir.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/fish.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdresource.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdresource.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdresource.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdscript.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdscript.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gdscript.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gomod.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gomod.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/gomod.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/graphql.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/graphql.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hcl.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hcl.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hcl.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/heex.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/heex.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/heex.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hjson.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hjson.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/hjson.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/json5.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/json5.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/json5.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/julia.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/julia.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/julia.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ledger.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ledger.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ledger.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/nix.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/nix.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/nix.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ql.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ql.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/ql.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/query.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/surface.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/surface.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/surface.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/teal.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/teal.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/teal.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/tlaplus.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/tlaplus.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/tlaplus.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/yang.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/yang.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/yang.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/zig.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/ftdetect/zig.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-office/ftdetect/office.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-office/ftdetect/office.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/vim-office/ftdetect/office.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/jsonc.vim/ftdetect/jsonc.vim]], false)
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/pgsls/ftdetect/glsl.vim]], true)
vim.cmd [[source /home/shawn/.local/share/nvim/site/pack/packer/opt/pgsls/ftdetect/glsl.vim]]
time([[Sourcing ftdetect script at: /home/shawn/.local/share/nvim/site/pack/packer/opt/pgsls/ftdetect/glsl.vim]], false)
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
