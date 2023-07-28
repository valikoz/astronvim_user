local utils = require "user.utils"
return {
  options = {
    opt = {
      wrap = true, -- sets vim.opt.wrap
      swapfile = false,
    },
    g = {
      -- mapleader = ",",
      python3_host_prog = vim.fn.has "win64" == 1
        and '~/AppData/Local/nvim/lua/user/env/Scripts/python'
        or '~/.config/nvim/lua/user/env/bin/python',
      loaded_ruby_provider = 0,
      loaded_perl_provider = 0,
    },
  },

  autocmds = {
    -- Remove whitespace
    vim.api.nvim_create_user_command('WhiteSpaceClean', '%s/\\s\\+$//e|nohlsearch', {}),
    -- Edit snippets
    vim.api.nvim_create_user_command("LuaSnipEdit", function()
      require('luasnip.loaders').edit_snippet_files({})
    end, { bang = true, desc = "Edit snippets" }),
    -- Open snippets list
    vim.api.nvim_create_user_command("LuaSnipInfo", function()
      require("luasnip.extras.snippet_list").open()
    end, { bang = true, desc = "Open snippets list" }),
  },

  mappings = {
    n = {
        -- disable default bindings
      ["<C-Down>"] = false,
      ["<C-Left>"] = false,
      ["<C-Right>"] = false,
      ["<C-Up>"] = false,
      ["<C-q>"] = false,
      ["<C-s>"] = false,
      ["<leader>mp"] = {
        function()
          local filename = vim.fn.expand "%:t"
          if vim.bo.filetype == "python" then
            vim.cmd "silent! write"
            utils.async_run({ "python3", vim.fn.expand "%:p" }, {
              title = "Execute " .. filename
            })
          else
            vim.notify("Cannot execute " .. filename, 3, { title = "Warning" } )
            return nil
          end
        end,
        desc = "Execute python file",
      },
      ["<leader>ml"] = {
        function()
          local filename = vim.fn.expand "%:t"
          if vim.bo.filetype == "lua" then
            vim.cmd "silent! write"
            utils.async_run({ "lua", vim.fn.expand "%:p" }, { title = "Execute " .. filename })
          else
            vim.notify("Cannot execute " .. filename, 3, { title = "Warning" } )
            return nil
          end
        end,
        desc = "Execute lua file",
      },
    },
  },

  lsp = {
    servers = {
      "pyright",
      -- "lua_ls",
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
    mappings = {},
  },
}
