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
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        },
      },
    },
  },
}
