return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    -- locally load snippets
    { 
      dir = "~/plugins/sniplib.nvim",
      config = function() require("sniplib").lazy_load() end 
    },
  },
  config = function()
    require("luasnip").config.setup {
      enable_autosnippets = true,
      store_selection_keys = "<c-x>",
      history = true,
      update_events = "TextChanged,TextChangedI",
    }
    -- load snippets paths
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "./lua/user/snippets", },
    }
    require("luasnip.loaders.from_vscode").load {
      exclude = { "tex", },
    }
  end,
}
