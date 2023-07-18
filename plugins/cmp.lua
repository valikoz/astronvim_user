return { 
  -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then return end
    -- modify the mapping part of the table
    opts.mapping["<C-e>"] = cmp.mapping { 
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
    end, {'i', 's'})
    opts.mapping["<C-p>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(-1)
      else
        fallback()
      end
    end, {'i', 's'})
    -- return the new table to be used
    opts.mapping['<Right>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expandable() then
        luasnip.expand()
      else
        fallback()
      end
    end, {'i', 's'})
    opts.mapping['<Left>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'})
    return opts
  end,
}

