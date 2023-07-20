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
    vim.api.nvim_create_user_command('WhiteSpace', '%s/\\s\\+$//e|nohlsearch', {})
  },
}
