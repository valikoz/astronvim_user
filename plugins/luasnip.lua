return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").config.setup {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      history = false,
    }
    -- load snippets paths
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "./lua/user/snippets" },
      -- exclude = { vim.fn.has "unix" == 1 and "tex" }
    }
    require("luasnip.loaders.from_vscode").lazy_load {
      include = { "lua", "python", "rust", "go", "cpp",
        "html", "css", "javascript", "all"
      }
    }
  end,
}
