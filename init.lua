return {
  -- Set colorscheme to use
  colorscheme = "astrodark",

  options = {
    opt = {
      wrap = true, -- sets vim.opt.wrap
      swapfile = false,
    },
  },

  autocmds = {
    -- Remove whitespace
    vim.api.nvim_create_user_command('WhiteSpace', '%s/\\s\\+$//e|nohlsearch', {}),
    -- Edit snippets
    vim.api.nvim_create_user_command("LuaSnipEdit", function()
      require('luasnip.loaders').edit_snippet_files()
    end, { bang = true, desc = "Edit snippets" }),
    -- Open snippets list
    vim.api.nvim_create_user_command("LuaSnipInfo", function()
      require("luasnip.extras.snippet_list").open()
    end, { bang = true, desc = "Open snippets list" })
  },
  
}
