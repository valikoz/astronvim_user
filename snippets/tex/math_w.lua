--[[
i --> the snippet is expanded even if the word ([%w_]+) before
the cursor does not match the trigger entirely, wordTrig=false;
A --> auto expand, snippetType="autosnippet".
]]
--[[ Snippets
-- matrix  -- 
]]

--[[ Imports ]]
local make_condition = require("luasnip.extras.conditions").make_condition
local conditions = require("user.snippets.tex.utils.conditions")
local in_math = make_condition(conditions.in_math)
local snippet = require("luasnip").extend_decorator.apply(s, 
  { show_condition = in_math }
)

local math_w = {
  snippet(
    {
      trig = "([bBpvV])mat(%d+)(%d+)([ar])",
      name = "[bBpvV]matrix",
      dscr = "repeat autosnippet for cmp",
    },
    {
      i(1, "[bBpvV]"), t("mat"), i(2, "%d"), i(3, "%d"),
      i(4, "[ar]")
    },
    {
      show_condition = in_math
    }
  ),
  snippet(
    {
      trig = "Vec",
      name = [[pmatrix]],
      dscr = [[\begin{pmatrix}...\end{pmatrix} column vector (w)]]
    },
    fmta([[
      \begin{pmatrix} <>_<> \\ \vdots \\ <>_<> \end{pmatrix}
      ]],
      { i(1, 'x'), i(2, '1'), rep(1), i(0, 'n') }
    ),
    { show_condition = in_math }
  ),
}

return math_iA
