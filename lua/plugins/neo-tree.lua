return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
      
    },
    window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["<C-b>"] = { "scroll_preview", config = {direction = 10} },
          ["<C-f>"] = { "scroll_preview", config = {direction = -10} },
        }
      },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              '.git',
              -- '.DS_Store',
              -- 'thumbs.db',
            },
            never_show = {},
          },
        }
     })
      vim.keymap.set('n', '<C-n>', ':Neotree dir=%:p:h:h filesystem reveal left<CR>',{})
    end
  }


