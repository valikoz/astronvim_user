return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        width = function() return math.min(120, vim.o.columns * 0.75) end,
        height = 0.9,
        options = {
          number = false,
          relativenumber = false,
          foldcolumn = "0",
          list = false,
          showbreak = "NONE",
          signcolumn = "no",
        },
      },
      plugins = {
        options = {
          cmdheight = 1,
          laststatus = 0,
        },
        twilight = { enabled = false }, -- disable to start Twilight when zen mode opens
      },
      on_open = function() -- disable diagnostics, indent blankline, and winbar
        vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
        vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
        vim.g.winbar_old = vim.wo.winbar
        vim.g.diagnostics_mode = 0
        vim.g.indent_blankline_enabled = false
        vim.wo.winbar = nil
        vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[vim.g.diagnostics_mode])
      end,
      on_close = function() -- restore diagnostics, indent blankline, and winbar
        vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
        vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
        vim.wo.winbar = vim.g.winbar_old
        vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[vim.g.diagnostics_mode])
      end,
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "TwilightEnable",
    opts = {
      context = -1,
    }
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "emmylua" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "User Astrofile",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  { "junegunn/vim-easy-align", event = "User AstroFile" },
  {
    "echasnovski/mini.surround",
    keys = {
      { "sa", desc = "Add surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete surrounding" },
      { "sh", desc = "Highlight surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "sn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = { n_lines = 100, mappings = { find = '', find_left = '' } },
  },
  -- Need to install sed (replace tool)
   {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = function()
      local prefix = "<leader>s"
      return {
        open_cmd = "new",
        mapping = {
          send_to_qf = { map = prefix .. "q" },
          replace_cmd = { map = prefix .. "c" },
          show_option_menu = { map = prefix .. "o" },
          run_current_replace = { map = prefix .. "C" },
          run_replace = { map = prefix .. "R" },
          change_view_mode = { map = prefix .. "v" },
          resume_last_search = { map = prefix .. "l" },
        },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "User AstroFile",
    opts = {
      modes = {
        -- disable during regular search
        search = { enabled = false, },
        char = {
          enabled = false,
          -- hide after jump when not using jump labels
          autohide = true,
          -- set to `false` to use the current line only
          multi_line = false,
          keys = { "f", "F", "t", "T", ";", [","] = "<localleader>" },
        },
      },
    },
    keys = {
      { "sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
  },
  {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    cmd = {
      "DistantLaunch",
      "DistantOpen",
      "DistantConnect",
      "DistantInstall",
      "DistantMetadata",
      "DistantShell",
      "DistantShell",
      "DistantSystemInfo",
      "DistantClientVersion",
      "DistantSessionInfo",
      "DistantCopy",
    },
    config = function()
        require('distant'):setup()
    end
  },
}
