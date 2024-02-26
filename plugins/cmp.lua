return {
  -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lua", ft = "lua", },
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then return end

    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end
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
    -- Use arrows to cycle between nodes from choice_node
    opts.mapping["<Right>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping["<Left>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
    opts.mapping["<C-a>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        require "luasnip.extras.select_choice"()
      else
        fallback()
      end
    end,
    { 'i', 's' })
    opts.mapping['<C-n>'] = cmp.config.disable
    opts.mapping['<C-p>'] = cmp.config.disable
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
      elseif has_words_before() then
        cmp.complete()
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
