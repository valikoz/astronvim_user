return {
  lua_ls = {
    settings = {
      Lua = {
        hint = { enable = true, arrayIndex = "Disable" },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
  },
  rust_analyzer = {
    cmd = {
      "rustup", "run", "stable", "rust-analyzer",
    },
    flags = {
      debounce_text_changes = 150,
    },
  },
}
