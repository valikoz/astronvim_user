return function()
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  local nontext = get_hlgroup "NonText"
  local bg_alt = get_hlgroup("Visual").bg
  local statement = get_hlgroup "Statement"
  return {
    CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
    GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
    HighlightURL = { underline = true }, -- always underline URLs
    OctoEditable = { fg = "NONE", bg = "NONE" }, -- use treesitter for octo.nvim highlighting
    Conceal = { bold = true, fg = statement.fg },
    EndOfBuffer = { link = "NonText" },
    TelescopeSelection = { fg = "#f2cdcd", bg = bg_alt },
  }
end
