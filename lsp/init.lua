return {
  servers = {
    "pyright",
    -- "lua_ls",
    -- "rust_analyzer",
  },
  config = {
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
    },
  },
  formatting = {
    -- format_on_save = false, -- enable or disable automatic formatting on save
    disabled = {
      "lua_ls",
      "rust_analyzer",
    },
    filter = function(client)
      -- disable formatting for lua_ls
      -- if client.name == "lua_ls" then
      --   return false
      -- end

      -- only enable null-ls for javascript files
      if vim.bo.filetype == "javascript" then
        return client.name == "null-ls"
      end

      -- enable all other clients
      return true
    end,
  },
}
