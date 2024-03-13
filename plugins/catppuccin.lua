return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = false,
    show_end_of_buffer = true,
    dim_inactive = { enabled = true, percentage = 0.25 },
    integrations = {
      alpha = false,
      dashboard = false,
      flash = false,
      nvimtree = false,
      ts_rainbow = false,
      ts_rainbow2 = false,
      barbecue = false,
      indent_blankline = false,
      navic = false,
      dropbar = false,

      aerial = true,
      dap = { enabled = true, enable_ui = true },
      headlines = true,
      mason = true,
      native_lsp = { enabled = true, inlay_hints = { background = false } },
      neogit = true,
      neotree = true,
      noice = true,
      notify = true,
      sandwich = true,
      semantic_tokens = true,
      symbols_outline = true,
      -- telescope = { enabled = true, style = "nvchad" },
      which_key = true,
    },
    custom_highlights = {
      -- disable italics  for treesitter highlights
      TabLineFill = { link = "StatusLine" },
      LspInlayHint = { style = { "italic" } },
      ["@parameter"] = { style = {} },
      ["@type.builtin"] = { style = {} },
      ["@namespace"] = { style = {} },
      ["@text.uri"] = { style = { "underline" } },
      ["@tag.attribute"] = { style = {} },
      ["@tag.attribute.tsx"] = { style = {} },
    },
  },
  config = function()
    mappings = {
      ["t"] = { function()
        local cat = require("catppuccin")
        cat.options.transparent_background = not cat.options.transparent_background
        cat.compile()
        vim.cmd.colorscheme(vim.g.colors_name)
      end,
      "Toggle transparency"
      },
    }
    require("which-key").register(mappings, {
      mode = "n",
      prefix = "<leader><localleader>"
    })
  end
}
