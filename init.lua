vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local plugins={
  {"xero/miasma.nvim",lazy = false,priority = 1000,config = function() vim.cmd("colorscheme miasma") end},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts={}
require("lazy").setup(plugins,opts)
local builtin=require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files,{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
local config=require("nvim-treesitter.configs")
config.setup({
  ensure_installed={"c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html","rust"},
  highlight = { enable = true },
  indent = { enable = true },
})
