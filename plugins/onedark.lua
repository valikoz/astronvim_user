return {
  'navarasu/onedark.nvim',
  config = function()
    require("onedark").setup {
      style = "warm",
      transparent = false,
      -- toggle theme style ---
      toggle_style_key = ",c", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
      -- colors = {
      --   green = '#5fff00',
      --   blue = "#50a4e9",
      -- },
    }
  end,
}
