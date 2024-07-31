return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  prioritty = 1000,
  config = function() vim.cmd.colorscheme "catppuccin"
  end
}
