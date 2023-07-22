return {
  -- Set colorscheme to use
  colorscheme = "astrodark",

  options = {
    opt = {
      wrap = true, -- sets vim.opt.wrap
      swapfile = false,
    },
    g = {
      python3_host_prog = '~/AppData/Local/nvim/lua/user/env/Scripts/python',
      loaded_ruby_provider = 0,
      loaded_perl_provider = 0,
    },
  },

  autocmds = {
    -- Remove whitespace
    vim.api.nvim_create_user_command('WhiteSpaceClean', '%s/\\s\\+$//e|nohlsearch', {}),
    -- Edit snippets
    -- vim.api.nvim_create_user_command("LuaSnipEdit", function()
    --   require('luasnip.loaders').edit_snippet_files()
    -- end, { bang = true, desc = "Edit snippets" }),
    -- Open snippets list
    -- vim.api.nvim_create_user_command("LuaSnipInfo", function()
    --   require("luasnip.extras.snippet_list").open()
    -- end, { bang = true, desc = "Open snippets list" })
  },
}
