return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
  -- override the options table
    opts.exclude.filetypes = {
      "gitcommit",
      "markdown",
      "text",
      "plaintex",
      "tex",
    }
    return opts
  end
}
