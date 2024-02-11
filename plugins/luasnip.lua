return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      enabled = false,
    },
    {
      "valikoz/friendly-snippets",
      name = "friendly-snippets-forked",
    },
  },
  config = function()
    require("luasnip").config.setup {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      history = false,
    }
    -- load snippets paths
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "./lua/user/snippets/lua" },
    }
    require("luasnip.loaders.from_vscode").lazy_load {
      exclude = {
        "tex",
      },
    }
  end,
}
