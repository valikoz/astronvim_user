return {
  opt = {
    wrap = true, -- sets vim.opt.wrap
    swapfile = false,
    scrolloff = 5,
  },
  g = {
    python3_host_prog = 0,
    -- python3_host_prog = vim.fn.has "win64" == 1
    --   and '~/AppData/Local/nvim/lua/user/env/Scripts/python'
    --   or '~/.config/nvim/lua/user/env/bin/python',
    loaded_ruby_provider = 0,
    loaded_perl_provider = 0,
  },
}
