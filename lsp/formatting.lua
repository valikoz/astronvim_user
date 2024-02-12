return {
  format_on_save = {
    enabled = true, -- enable format on save
    ignore_filetypes = { -- disable format on save for specified filetypes
      "lua",
      "python",
    },
  },
  -- List of language server client names will be disabled with you format your
  -- code either on save, with <leader>lf, or with :Format.
  disabled = {
    "lua_ls",
    "rust_analyzer",
  },
  filter = function(client)
    -- only enable null-ls for javascript files
    if vim.bo.filetype == "javascript" then
      return client.name == "null-ls"
    end

    -- enable all other clients
    return true
  end,
}
