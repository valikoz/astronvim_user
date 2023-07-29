return {
  "pyright",
  -- "lua_ls",
  vim.fn.has "unix" == 1 and "rust_analyzer" or nil,
}
