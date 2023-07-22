return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").config.setup {
      history = (vim.bo.filetype == 'tex'),
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    }
    -- load snippets paths
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { "./lua/user/snippets" }
    }
    require("luasnip.loaders.from_vscode").lazy_load {
      include = { "lua", "python", "rust", "go", }
    }
  end,
}
