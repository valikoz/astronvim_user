return {
  -- Set colorscheme to use
  colorscheme = "astrodark",
  
  plugins = {
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        -- include the default astronvim config that calls the setup call
        require "plugins.configs.luasnip"(plugin, opts)
        -- load snippets paths
        require("luasnip.loaders.from_lua").lazy_load {
          paths = { "./lua/user/snippets" }
        }
      end,
    },
  },
}
