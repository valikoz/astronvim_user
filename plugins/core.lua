return {
  { "goolord/alpha-nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  --- TIPS: z= • Spelling suggestion
  {
    "folke/which-key.nvim",
    keys = { "<leader>", },
    event = function() return { "User AstroFile" } end,
    opts = {
      plugins = {
          marks = false, -- shows a list of your marks on ' and `
          registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      },
      layout = {
        height = { min = 4, max = 15 },
      },
      window = {
        winblend = 20, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    }
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 0,
      background_colour = "#000000",
    }
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text", config = true },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          always_show = { ".github", ".gitignore" },
        },
          follow_current_file = {
            -- enabled = false,
            leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
      },
    },
  },
  {
    --- TODO: fix "dressinginput"
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = {
            "tex", "TelescopePrompt", "text",
            "neo-tree-popup", "spectre_panel",
            "nofile", "quickfix", "prompt",
            "dressinginput", "DressingSelect",
        },
      })
      require('nvim-autopairs').remove_rule([[`]])
    end
  }
}
