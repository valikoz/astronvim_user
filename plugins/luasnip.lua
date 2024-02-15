return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    { "rafamadriz/friendly-snippets", enabled = false, },
    -- locally load vscode snippets
    { dir = "~/plugins/friendly-snippets/", name = "vscode-snippets" },
  },
  config = function()
    require("luasnip").config.setup {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      history = false,
    }
    -- load snippets paths
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "./lua/user/snippets/lua", },
    }
    require("luasnip.loaders.from_vscode").load {
      exclude = { "tex", },
    }
  end,
}
