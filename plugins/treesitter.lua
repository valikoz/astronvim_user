return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "HiPhish/rainbow-delimiters.nvim",
        opts = function()
          return {
            strategy = {
              [""] = function()
                if not vim.b.large_buf then return require("rainbow-delimiters").strategy.global end
              end,
            },
          }
        end,
        config = function(_, opts) require "rainbow-delimiters.setup"(opts) end,
      },
    },
    opts = {
       highlight = {
         enable = true,
         disable = { "latex" },
         additional_vim_regex_highlighting = { "latex", "markdown" },
       },

      context_commentstring = {
        enable = true,

        -- With Comment.nvim, we don't need to run this on the autocmd.
        -- Only run it in pre-hook
        enable_autocmd = false,

        config = {
          c = "// %s",
          lua = "-- %s",
        },
      },
    },
  },
}
