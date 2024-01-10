return {
  -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- { "hrsh7th/cmp-omni", enabled = vim.fn.has "win64" == 1, ft = "tex", },
    { "hrsh7th/cmp-nvim-lua", ft = "lua", },
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then return end
    -- modify the mapping part of the table
    opts.mapping["\f"] = cmp.mapping { -- <c-l> 0x0C FORM FEED
      i = function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end,
      c = cmp.mapping.close(),
    }
    opts.mapping["<C-n>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping["<C-p>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping['<Right>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      -- elseif luasnip.expandable() then
      --   luasnip.expand()
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping['<Left>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
      -- elseif luasnip.jumpable(-1) then
      --  luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip",  priority = 750 },
      {
        name = "buffer",
        priority = 500,
        option = {
          get_bufnrs = function() return vim.api.nvim_list_bufs() end,
        },
      },
      { name = "path",     priority = 250 },
      { name = "nvim_lua", priority = 50 },
      -- { name = "omni",     priority = 50 },
    }
    -- return the new table to be used
    return opts
  end,
}
